#!/usr/bin/env bash

set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
binary_path="$(mktemp /tmp/multiplication-table-test.XXXXXX)"
trap 'rm -f "$binary_path"' EXIT

g++ -std=c++17 -Wall -Wextra -Werror "$project_dir/main.cpp" -o "$binary_path"

output="$(printf '3\n-1\n13\n0\n' | timeout 2s "$binary_path")"
grep -Fq '   1   2   3' <<<"$output"
grep -Fq '   2   4   6' <<<"$output"
grep -Fq '   3   6   9' <<<"$output"
grep -Fq 'Number must be between 1 and 12.' <<<"$output"
grep -Fq 'Goodbye!' <<<"$output"

if non_numeric_output="$(printf 'hello\n0\n' | timeout 2s "$binary_path")"; then
  :
else
  echo 'Expected non-numeric input to be handled before exit.' >&2
  exit 1
fi
grep -Fq 'Please enter a whole number.' <<<"$non_numeric_output"
grep -Fq 'Goodbye!' <<<"$non_numeric_output"

echo 'All multiplication-table tests passed.'
