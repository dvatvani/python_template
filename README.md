# Python Project Template

A Copier template for bootstrapping modern Python projects with a reproducible workflow: `uv`, `ruff`, `ty`, and tests.

## Why this template
- Start fast with a clean `src/` layout and starter modules.
- Generate either a library or a [Typer](https://typer.tiangolo.com/) command-line app with an installed entry point.
- Keep quality automated with linting, formatting, typing, and tests.
- Use reproducible environments and lockfiles for reliable builds.
- Get GitHub Actions CI and weekly Dependabot updates out of the box.
- Cut releases with `just release`: Commitizen bumps the version, updates the changelog and tags the release.

## Technology stack
- [Copier](https://copier.readthedocs.io/) for project scaffolding and updateable generation.
- [uv](https://docs.astral.sh/uv/) for dependency management, virtual environments, lockfiles, and packaging via `uv_build`.
- [ruff](https://docs.astral.sh/ruff/) for linting and formatting.
- [ty](https://docs.astral.sh/ty/) for type checking.
- `pre-commit` to run hooks before commits.
- `pytest` and `pytest-cov` for tests and coverage.
- [Commitizen](https://commitizen-tools.github.io/commitizen/) for Conventional Commits, versioning, and changelog automation.
- `AGENTS.md.jinja` to generate a project-specific `AGENTS.md` during scaffolding and keep coding-agent instructions consistent across projects.

## Quick start

### 1. Install [`uv`](https://github.com/astral-sh/uv)

Installation instructions are [here](https://docs.astral.sh/uv/getting-started/installation/).
It's recommended to install the latest version from [github releases](https://github.com/astral-sh/uv/releases).

If you have already installed `uv`, please ensure you're using the latest version by running `uv self update`.

### 2. Install [`just`](https://just.systems/)

`just` runs the generated project's tasks. Install it with your system package manager (e.g. `brew install just`) or via `uv`:

```bash
uv tool install rust-just
```

### 3. Create the project using [copier](https://github.com/copier-org/copier):

Launch the following command and answer carefully to the prompts:

```bash
uvx copier copy https://github.com/dvatvani/python_template.git <desired_path>
```

> [!IMPORTANT]
> Copier always generates a `.copier-answers.yml` file. Commit the file with the other files and **never** change it manually.

### 4. Setup and first push

```bash
git init --initial-branch=main
just install
git add .
git commit -m "feat: first commit"
gh repo create <github_username>/<project_slug> --private --source=. --push
```

If you don't use the [GitHub CLI](https://cli.github.com/), create the repository on github.com and push to it instead:

```bash
git remote add origin <remote_repository_URL>
git push --set-upstream origin main
```

## Update an existing project
1. Move inside your project and make sure that there are no local changes (in case you have local changes, commit or stash them).

2. Pull in the latest version of the template with:
   ```bash
   just update-template
   ```
   This runs `uvx copier@latest update --defaults` (re-using your previous answers) followed by `uv lock`.
3. Resolve any conflicts and commit the changes.

## Developing the template

The template has its own test suite (in `tests/`, using [pytest-copier](https://github.com/noirbizarre/pytest-copier)) which renders projects from the current working copy and checks that they:
- contain the expected files and correctly derived names,
- pass the same ruff / ty / pytest steps as the generated CI workflow,
- pass `just install`, `just check` and `just test`,
- build with `uv build`, and
- can run `just update-template` cleanly.

Requires [`uv`](https://docs.astral.sh/uv/) and [`just`](https://just.systems/). Run the suite with:

```bash
just test
```

Lint the test suite itself with `just check`.

Both run in CI (`.github/workflows/template-ci.yaml`) on every pull request and on pushes to `main`.

## Acknowledgements

This template was originally based on [mameli/python_template](https://github.com/mameli/python_template).
