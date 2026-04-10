<p align="center">
  <img src="docs/jovocoder-source.png" alt="JovoCoder Logo" width="300"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-0.2.0-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/local--first-yes-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/no%20api-required-blueviolet?style=for-the-badge" />
  <img src="https://img.shields.io/badge/execution-engine-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/license-MIT-green?style=for-the-badge" />
</p>

# JovoCoder

JovoCoder is a local-first command runner and task router for grounded, read-safe infrastructure work.

It can sit on top of MemPalace when a memory layer is available, but it can still run its core execution and audit paths without MemPalace.

---

## What JovoCoder Is

JovoCoder is not just a chat interface.

It is a shell-driven operator layer that takes input, routes it, validates it, and then either:

- executes a safe command
- runs a predefined audit path
- performs a task-oriented execution loop
- or uses MemPalace for grounded recall when that memory layer is available

In practice, it is a controlled interface for local and remote operational work.

---

## What “Built on Top of MemPalace” Means

MemPalace is the memory and retrieval layer.

When MemPalace is present, JovoCoder can use it to:
- recall grounded notes and system context
- answer memory-style queries
- route some natural-language prompts into evidence-backed lookups

JovoCoder does **not** require MemPalace for its core execution paths.

Its execution features such as:
- `/exec`
- `/audit`
- `/ssh-audit`
- `/exec-task`

can still function independently, as long as the local runtime, shell environment, SSH configuration, and target definitions are in place.

So the relationship is:

- **MemPalace** = optional memory and retrieval layer
- **JovoCoder** = routing, validation, execution, and audit layer
- **Ollama** = optional local model runtime used for interpretation or task assistance where configured

---

## How It Can Run Without MemPalace

If MemPalace is unavailable, JovoCoder can still operate as an execution tool.

That includes:
- running direct commands
- performing local audits
- executing SSH-based checks against configured safe targets
- handling task flows that resolve to deterministic execution paths

What you lose without MemPalace is the memory-backed recall layer, not the operator layer.

In other words:

- without MemPalace, JovoCoder is still a useful execution and audit tool
- with MemPalace, it gains grounded recall and evidence-aware lookup behavior

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

JovoCoder is not a general autonomous agent that should improvise across unknown systems.

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

3. **Memory path**  
   Grounded lookup through MemPalace, when available

This separation matters because it keeps memory, routing, and execution from collapsing into one opaque step.

---

## Example

```text
/exec-task audit test.artistpro.media for apache and php health
```

Possible output:

```text
AUDIT SUMMARY:
Target: test.artistpro.media
Host: dreamy-hermann...
Web: apache
Web Version: 2.4.52
PHP: 8.1.2
HTTP: 200
Status: PASS
```

---

## Core Commands

```text
/exec <command>
/audit
/ssh-audit <target>
/exec-task <task>
/exec-task explain <task>
```

---

## Features

- Local-first operation
- No API requirement for core shell and audit behavior
- Read-safe command validation
- SSH automation using configured safe targets
- Natural-language routing for certain audit/task prompts
- Web stack detection for remote audits
- Optional memory-backed recall through MemPalace
- Optional local-model support through Ollama

---

## Safety Model

JovoCoder is designed around constrained execution.

Principles:
- one step at a time
- validate before execution
- prefer read-only paths
- avoid destructive operations
- do not invent results
- surface real command output

It is meant to reduce operational guesswork, not hide it.

---

## Install

```bash
bash scripts/install.sh
bash scripts/verify.sh
```

---

## Run

```bash
jovocoder
```

---

## Optional: Auto-Launch on SSH Login

```bash
echo '
# auto-start jovocoder for interactive ssh
if [[ $- == *i* ]]; then
  if command -v jovocoder >/dev/null 2>&1; then
    jovocoder
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

## Attribution

JovoCoder is designed to work with [MemPalace](https://github.com/mikelawson68/mempalace) as an upstream memory layer.

When MemPalace is available, JovoCoder can use it for grounded recall and lookup.
When MemPalace is absent, JovoCoder still functions as a local execution and audit tool.

MemPalace attribution should remain with its original authors and project materials.

---

## Status

**v0.2.0 — Execution Engine Release**

This version establishes JovoCoder as a practical local operator layer with:
- validated execution
- SSH audit support
- natural-language routing
- optional MemPalace-backed recall
