# Template maintenance tasks (see https://just.systems/)

set shell := ["bash", "-euc"]

[private]
default:
  @just --list

# Lint the template test suite
check:
    uv lock --check
    uv run ruff format --check
    uv run ruff check

# Render projects from the template and check they build, lint and pass their tests
test *args:
    uv run pytest -n auto {{args}}
