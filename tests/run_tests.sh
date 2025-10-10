#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${ROOT_DIR}/config"
LOG_DIR="${ROOT_DIR}/logs"

generate_configs() {
  mkdir -p "${CONFIG_DIR}"

  python3 - <<'PY'
from pathlib import Path

root = Path(__file__).resolve().parent
config_dir = root / "config"
config_dir.mkdir(parents=True, exist_ok=True)

(root / "config" / "strategy_tests_config.gpr").write_text(
    """abstract project Strategy_Tests_Config is

   Build_Profile := External ("STRATEGY_TESTS_BUILD_PROFILE", "validation");

   Ada_Compiler_Switches := ();

end Strategy_Tests_Config;
"""
)

test_dirs = ["src", "one_of"]
main_units = []
for subdir in test_dirs:
    base = root / subdir
    if base.exists():
        for file in sorted(base.glob("strategy_tests-*.adb")):
            main_units.append(f'   "{file.stem}"')

if not main_units:
    raise SystemExit("no test units found under src/ or one_of/")

list_content = """abstract project Strategy_Tests_List_Config is

   Test_Mains := (
"""
list_content += ",\n".join(main_units)
list_content += """
   );

end Strategy_Tests_List_Config;
"""

(config_dir / "strategy_tests_list_config.gpr").write_text(list_content)
PY
}

build_tests() {
  (cd "${ROOT_DIR}" && alr build)
}

run_binaries() {
  local bin_dir="${ROOT_DIR}/bin"
  if [[ ! -d "${bin_dir}" ]]; then
    printf 'error: expected directory %s not found\n' "${bin_dir}" >&2
    exit 1
  fi

  mkdir -p "${LOG_DIR}"

  local failures=0
  for exe in "${bin_dir}"/*; do
    [[ -x "${exe}" ]] || continue
    local name
    name="$(basename "${exe}")"
    local log_file="${LOG_DIR}/${name}.log"
    printf 'running %s\n' "${name}"
    if ! "${exe}" >"${log_file}" 2>&1; then
      printf 'error: %s failed (see %s)\n' "${name}" "${log_file}" >&2
      tail -n 20 "${log_file}" >&2
      failures=$((failures + 1))
    else
      printf '  ok -> %s\n' "${log_file}"
    fi
  done

  if (( failures > 0 )); then
    printf '%d test executable(s) failed\n' "${failures}" >&2
    exit 1
  fi
  printf 'logs stored under %s\n' "${LOG_DIR}"
}

generate_configs
build_tests
run_binaries
