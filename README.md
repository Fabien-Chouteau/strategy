# Strategy

A property-based testing framework for Ada.

## Overview

Property-based testing allows you to define properties that should always hold true for your code. Strategy generates test cases automatically to verify these properties across a wide range of inputs.

## Building

```bash
alr build
```

## Running Tests

```bash
alr test
```

Note: The test runner requires Alire nightly build.

## Example

```ada
-- Instead of testing specific values like assert(add(2, 3) = 5)
-- You test properties like "addition is commutative"
for all A, B in Integer => add(A, B) = add(B, A)
```

The framework includes strategies for tuples, enums, modular arithmetic, arrays, and vectors.
