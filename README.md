<p align="center">
  <img src="docs/logo.png" alt="Nomad Logo" width="300"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-0.2.0-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/local--first-yes-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/no%20api-required-blueviolet?style=for-the-badge" />
  <img src="https://img.shields.io/badge/execution-engine-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/license-MIT-green?style=for-the-badge" />
</p>

# Nomad

Nomad is an autonomous infrastructure orchestrator for grounded, read-safe work.

---

## What Nomad Is

Nomad is not just a chat interface.

It is a shell-driven operator layer that takes input, routes it, validates it, and then either:

- executes a safe command
- runs a predefined audit path
- performs a task-oriented execution loop

In practice, it is a controlled interface for local and remote operational work.

---

## What It Does

- Executes local commands through a validated path
- Runs SSH-based audits against configured targets
- Routes some natural-language prompts into audit or task commands
- Validates commands before execution
- Detects real system state such as host, uptime, disk, and web stack details
- Produces verifiable command output
- Stays local-first and shell-driven

---

## What It Does Not Try to Be

Nomad is not a general autonomous agent that should improvise across unknown systems.

It is designed for:
- controlled execution
- predictable routing
- grounded operational work
- safe read-focused infrastructure checks

The goal is not “maximum autonomy.”
The goal is useful automation without losing control.

---

## Execution Model

The basic flow is:

`input → route → validate → execute → inspect output`

Depending on configuration, a prompt may go through one of three paths:

1. **Direct command path**  
   Explicit commands such as `/exec` or `/audit`

2. **Task path**  
   Structured task execution through `/exec-task`

3. **Decision path**
   Structured execution through `/decision`

---

## Example

```text
/exec-task audit example-target for apache and php health
```

Possible output:

```text
AUDIT SUMMARY:
Target: EXAMPLE.SITE
Host: dreamy-hermann...
Web: apache
Web Version: 2.4.52
PHP: 8.1.2
HTTP: 200
Status: PASS
```

---

## Core Commands

Plain-form commands are preferred:

```text
exec <command>
audit
ssh-audit <target>
exec-task <task>
workflow <name>
decision <name>
run show <run_id>
run resume <run_id>
whoami
models list
models recommend
models plan-install <model_id>
models update <model_id>
models discover
bootstrap plan
bootstrap install
approve <run_id>
deny <run_id>
memory status
memory mode
memory plan-install mempalace
memory backend-test
```

Slash-prefixed forms remain available as compatibility aliases.

---

## Features

- Local-first operation
- No API requirement for core shell and audit behavior
- Read-safe command validation
- SSH automation using configured safe targets
- Natural-language routing for certain audit/task prompts
- Web stack detection for remote audits
- Optional local-model support through Ollama

---

## Safety Model

Nomad is designed around constrained execution.

Principles:
- one step at a time
- validate before execution
- prefer read-only paths
- avoid destructive operations
- do not invent results
- surface real command output

It is meant to reduce operational guesswork, not hide it.

---

## Installation

NOMAD is macOS-first and installable from this repository:

```bash
bash scripts/install-nomad.sh
```

The installer:

- checks macOS and required tools
- checks for Ollama
- supports guided mode by default when run interactively
- supports `--non-interactive` for dry review
- shows hardware-aware model recommendations by role
- does not silently install Ollama or MemPalace
- installs the NOMAD launcher at `/usr/local/bin/nomad`
- keeps approval gates intact for bootstrap and model setup

For SSH audits, keep real targets in `config/ssh_targets.local.json` and copy from `config/ssh_targets.local.json.example`.

If Ollama is missing, install it manually from:

```text
https://ollama.com/download
```

Then start it with:

```bash
ollama serve
```

For a dry review run:

```bash
bash scripts/install-nomad.sh --non-interactive
```

## First Run

The safe first-run flow is:

1. install
2. bootstrap plan
3. approve `<run_id>`
4. run resume `<run_id>`
5. models recommend
6. models plan-install `<model_id>`
7. approve `<run_id>`
8. run resume `<run_id>`

## Model Setup

Use these commands to inspect and prepare local models:

```text
models list
models recommend
models discover
models plan-install <model_id>
models update <model_id>
approve <run_id>
run resume <run_id>
```

Model actions are use-case aware, hardware aware, logged, and approval-gated.
NOMAD is intended to support role-based local models, such as coding, planning, reasoning, audit, and memory/recall roles.

## Approval Flow

All write-capable work uses the same `run_id` from plan to approval to execution.

```text
plan -> approve <run_id> -> run resume <run_id>
```

If approval is missing, denied, or invalid, execution fails safe.

## Memory System

NOMAD-native memory is authoritative for orchestration state.

```text
memory status
memory mode
memory plan-install mempalace
memory backend-test
```

MemPalace is optional. NOMAD still functions if it is absent.

## Project Direction

NOMAD is intended to be the local gatekeeper for projects and repositories:

- create local workspace first
- manage local repository lifecycle first
- only push to GitHub under explicit approval
- keep local-first execution and restore metadata as the default operating model

## Restore / Cleanup

Every write-capable path records restore metadata and a cleanup path.
If install or update verification fails, NOMAD prints the exact cleanup path before stopping.

---

## Run

```bash
nomad
```

---

## Optional: Auto-Launch on SSH Login

```bash
echo '
# auto-start nomad for interactive ssh
if [[ $- == *i* ]]; then
  if command -v nomad >/dev/null 2>&1; then
    nomad
    exit
  fi
fi
' >> ~/.bashrc
```

To bypass auto-launch:

```bash
ssh -t user@host "bash --noprofile --norc"
```

---

## Packaging

Release builds include package metadata and can include a configurable logo asset.

Set `NOMAD_LOGO_ASSET_PATH` at packaging time to include an external logo file in the release tarball.

## Status

**v0.2.0 — Emergent Autonomous Infrastructure Orchestrator**
