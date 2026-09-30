# Multiplication table

## Objective

Provide a console program that repeatedly accepts a whole number and displays
a square multiplication table from 1 through that number.

## Commands

- Build and run interactively: `./test_runner.sh`
- Run automated checks: `bash tests/test_multiplication_table.sh`

## Success criteria

- A valid number from 1 through 12 prints a multiplication grid with labeled
  x- and y-axes, from 1 through the entered number.
- Negative numbers, numbers greater than 12, and non-numeric input show an
  error and prompt again.
- Entering `0` exits the program.

## Boundaries

- Always validate console input and compile before testing.
- Never add dependencies or modify unrelated project files.
