# python_uv_template

This repository is a Copier template for bootstrapping modern Python data projects. It generates a ready-to-run repo with a `src/` layout, starter modules, tests, documentation scaffolding, and a reproducible workflow centered on `uv`. It also ships with a Makefile and helper scripts for setup, linting, type checks, tests, docs publishing, releases, and optional Docker builds, plus a Marimo playground so you can explore data without leaving the project structure.

Technology rundown:
- [Copier](https://copier.readthedocs.io/) for project scaffolding and updateable generation.
- [uv](https://docs.astral.sh/uv/) for fast dependency management, virtual environments, and lockfiles, with `uv_build` as the packaging backend.
- [ruff](https://docs.astral.sh/ruff/) for linting and formatting.
- [ty](https://docs.astral.sh/ty/) for type checking.
- `pre-commit` to run hooks before commits.
- `pytest` and `pytest-cov` for tests and coverage.
- [Marimo](https://marimo.io/) for reactive, reproducible notebooks stored as Python files.
- [Polars](https://docs.pola.rs/) for fast DataFrame work.
- [Seaborn](https://seaborn.pydata.org/) for quick statistical visualization.
- [MkDocs](https://www.mkdocs.org/) for documentation, themed with Material and extended via mkdocstrings for API docs, mkdocs-gen-files for generated pages, mkdocs-literate-nav for Markdown-driven navigation, mkdocs-section-index for clickable section indexes, mkdocs-autorefs for cross-page references, pymdown-extensions for richer Markdown, and mike for versioned docs publishing.
- [Docker](https://www.docker.com/) for containerized builds.
- [Commitizen](https://commitizen-tools.github.io/commitizen/) for Conventional Commits, versioning, and changelog automation.

### 1. Create the project folder

```bash
mkdir -p <project_name>
cd <project_name>
```

### 2. Install [`uv`](https://github.com/astral-sh/uv)


Installation instructions are [here](https://docs.astral.sh/uv/getting-started/installation/).
It's recommended to install the latest version from [github releases](https://github.com/astral-sh/uv/releases).

If you have already installed `uv`, please ensure you're using the latest version by running `uv self update`.

### 3. Create the project using [copier](https://github.com/copier-org/copier):

Launch the following command and answer carefully to the prompts:

```bash
uvx copier copy https://github.com/mameli/python_template.git .
```

> [!IMPORTANT]
> Copier always generates a `.copier-answers.yml` file. Commit the file with the other files and **never** change it manually.

#### 4. Setup and first push

```bash
git init --initial-branch=main
make install
git add .
git commit -m "feat: first commit"
git remote add origin <remote_repository_URL>
git push --set-upstream origin main
```

## Project update
1. Move inside your project and make sure that there are no local changes (in case you have local changes, commit or stash them).

2. Update your project to the latest Git tag of the template with the following command:
   ```bash
   uvx copier update --defaults
   ```
3. Resolve any conflicts and commit the changes.
