#!/usr/bin/env python3
import os

def gen_spec(num):
    out = ""
    out += "   generic\n"
    for x in range(num):
        letter = chr(65 + x)
        out += f"      with package {letter}_Strat is new Definite_Strategy (<>);\n"

    out += f"   package Tuple_{num} is\n"

    out +=  "      type Value is record\n"
    for x in range(num):
        letter = chr(65 + x)
        out += f"         {letter} : {letter}_Strat.Value;\n"
    out +=  "      end record;\n"
    out +=  "      package Value_Tree is new Definite_Value_Tree (Value);\n"
    out +=  "      package Impl is\n"
    out +=  "         type Node (<>) is new Value_Tree.Value_Node with private;\n"
    out +=  "         function Create (Ctx : in out Runner_Context'Class) return Node;\n"
    out +=  "      private\n"
    for x in range(num):
        letter = chr(65 + x)
        out += f"         package {letter}_Holders\n"
        out += f"         is new Ada.Containers.Indefinite_Holders ({letter}_Strat.Node, {letter}_Strat.\"=\");\n"

    options = ""
    for x in range(num):
        letter = chr(65 + x)
        end = ", " if x < num - 1 else ""
        options += f"{letter}{end}"
    
    out +=  f"         type Options is (None, {options});\n"
    out +=  "         subtype Valid_Options is Options range A .. Options'Last;\n"
    out +=  "         subtype Parent is Value_Tree.Value_Node;\n"
    out +=  "         type Node is new Parent with record\n"
    for x in range(num):
        letter = chr(65 + x)
        out += f"            {letter} : aliased {letter}_Holders.Holder;\n"

    out += "            Shrinker : Valid_Options := Valid_Options'First;\n"
    out += "            Prev_Shrinker : Options := None;\n"
    out += "         end record;\n"

           
    out += "         overriding\n"
    out += "         function Current (This : in out Node) return Value;\n"
    out += "         overriding\n"
    out += "         function Simplify (This : in out Node) return Boolean;\n"
    out += "         overriding\n"
    out += "         function Complicate (This : in out Node) return Boolean;\n"

    out += "      end Impl;\n"

    out += "      package Strat\n"
    out += "      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);\n"
    out += f"   end Tuple_{num};\n"

    return out

    
spec  = "with Ada.Containers.Indefinite_Holders;\n"
spec += "package Strategy.Tuples is\n"
for x in range(2, 11):
    spec += gen_spec(x)
spec += "end Strategy.Tuples;\n"

def gen_body(num):
    out = ""
    out += f"   package body Tuple_{num} is\n"
    out +=  "      package body Impl is\n"
    out +=  "         function Create (Ctx : in out Runner_Context'Class) return Node\n"
    out +=  "         is ((Parent with\n"
    for x in range(num):
        letter = chr(65 + x)
        out += f"              {letter} => {letter}_Holders.To_Holder ({letter}_Strat.Create (Ctx)),\n"
    out +=  "              others => <>));\n"
    out +=  "         overriding\n"
    out +=  "         function Current (This : in out Node) return Value is\n"
    out +=  "         begin\n"
    out +=  "            return (\n"
    for x in range(num):
        letter = chr(65 + x)
        end = "," if x < num - 1 else ");"
        out += f"                    {letter} => {letter}_Holders.Reference (This.{letter}).Current{end}\n"
    out +=  "         end Current;\n"

    out +=  "         overriding\n"
    out +=  "         function Simplify (This : in out Node) return Boolean is\n"
    out +=  "         begin\n"
    out +=  "            if (case This.Shrinker is\n"
    for x in range(num):
        letter = chr(65 + x)
        end = "," if x < num - 1 else ")"
        out += f"                   when {letter} => {letter}_Holders.Reference (This.{letter}).Simplify{end}\n"
    out +=  "            then\n"
    out +=  "               This.Prev_Shrinker := This.Shrinker;\n"
    out +=  "               return True;\n"
    out +=  "            else\n"
    out +=  "               if This.Shrinker /= Valid_Options'Last then\n"
    out +=  "                  This.Shrinker := Valid_Options'Succ (This.Shrinker);\n"
    out +=  "                  return Simplify (This);\n"
    out +=  "               else\n"
    out +=  "                  return False;\n"
    out +=  "               end if;\n"
    out +=  "            end if;\n"
    out +=  "         end Simplify;\n"

    out +=  "         overriding\n"
    out +=  "         function Complicate (This : in out Node) return Boolean is\n"
    out +=  "         begin\n"
    out +=  "            if (case This.Prev_Shrinker is\n"
    for x in range(num):
        letter = chr(65 + x)
        out += f"                   when {letter} => {letter}_Holders.Reference (This.{letter}).Complicate,\n"
    out +=  "                   when None => False)\n"
    out +=  "            then\n"
    out +=  "               This.Shrinker := This.Prev_Shrinker;\n"
    out +=  "               return True;\n"
    out +=  "            else\n"
    out +=  "               This.Prev_Shrinker := None;\n"
    out +=  "               return False;\n"
    out +=  "            end if;\n"
    out +=  "         end Complicate;\n"
    out += "      end Impl;\n"
    out += f"   end Tuple_{num};\n"

    return out

body = "package body Strategy.Tuples is\n"
for x in range(2, 11):
    body += gen_body(x)
body += "end Strategy.Tuples;\n"

src_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "src")

spec_filename = os.path.join(src_dir, "strategy-tuples.ads")
with open(spec_filename, "w", encoding="utf-8") as f:
    print(f"Writing {spec_filename}")
    f.write(spec)
body_filename = os.path.join(src_dir, "strategy-tuples.adb")
with open(body_filename, "w", encoding="utf-8") as f:
    print(f"Writing {body_filename}")
    f.write(body)
