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

A local-first AI execution engine that **doesn’t just remember — it acts.**

Built on top of MemPalace by Milla Jovovich & Ben Sigman, JovoCoder turns memory into a **safe, controlled, real-world operator system**.

---

## The Breakthrough

MemPalace solved memory.

JovoCoder solves what comes next:

What do you *do* with perfect recall?

Memory without execution is still friction.

What was missing:
- controlled execution  
- safe command loops  
- validation before action  
- real-world system interaction  

JovoCoder is that missing layer.

---

## The Real Problem

Modern AI tools:
- forget context  
- hallucinate success  
- ignore constraints  
- break production systems  
- force you to repeat yourself endlessly  

You don’t just lose time.

You lose control.

---

## What JovoCoder Actually Is

JovoCoder is not a chatbot.

It is:

TASK → planner → validator → execution → output → interpretation → repeat

A closed-loop system that:

- executes real commands  
- validates before running anything  
- operates on real infrastructure  
- produces verifiable results  

---

## What It Does

- Executes local and remote commands safely  
- Runs SSH-based audits automatically  
- Validates commands before execution  
- Detects real system state (Apache, nginx, PHP, etc.)  
- Produces structured audit summaries  
- Writes lessons learned for future runs  
- Operates entirely local-first (no APIs required)  

---

## Example

/exec-task audit test.artistpro.media for apache and php health

Output:

AUDIT SUMMARY:  
Target: test.artistpro.media  
Host: dreamy-hermann...  
Web: apache  
Web Version: 2.4.52  
PHP: 8.1.2  
HTTP: 200  
Status: PASS  

---

## How It Works

MemPalace → memory + retrieval  
JovoCoder → execution + validation loop  
Ollama → local model runtime  

---

## Features

- Local-first (no cloud required)  
- Zero API usage  
- Deterministic execution  
- SSH automation with key auth  
- Command validation (safety gating)  
- Web server detection (Apache / nginx)  
- Multi-target auditing  
- Explain mode (plan without execution)  
- Lessons learned write-back  

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

## Core Commands

```
/exec <command>
/audit
/ssh-audit <target>
/exec-task <task>
/exec-task explain <task>
```

---

## Execution Philosophy

- One command at a time  
- Read-only by default  
- No production writes  
- No destructive operations  
- Stop on mismatch  
- Validate before execution  
- Never hallucinate success  

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

JovoCoder is built on top of MemPalace.

MemPalace was created by Milla Jovovich & Ben Sigman and provides the memory layer.

JovoCoder adds execution, validation, and orchestration.

---

## Status

v0.2.0 — Execution Engine Release

This is the version where JovoCoder stops being an assistant  
and becomes an operator.- operates on real infrastructure  
- produces verifiable results  

---

## What It Does

- Executes local and remote commands safely  
- Runs SSH-based audits automatically  
- Validates commands before execution  
- Detects real system state (Apache, nginx, PHP, etc.)  
- Produces structured audit summaries  
- Writes lessons learned for future runs  
- Operates entirely local-first (no APIs required)  

---

## Example

/exec-task audit test.artistpro.media for apache and php health

Output:

AUDIT SUMMARY:
Target: test.artistpro.media  
Host: dreamy-hermann...  
Web: apache  
Web Version: 2.4.52  
PHP: 8.1.2  
HTTP: 200  
Status: PASS  

---

## How It Works

MemPalace → memory + retrieval  
JovoCoder → execution + validation loop  
Ollama → local model runtime  

---

## Features

- Local-first (no cloud required)  
- Zero API usage  
- Deterministic execution  
- SSH automation with key auth  
- Command validation (safety gating)  
- Web server detection (Apache / nginx)  
- Multi-target auditing  
- Explain mode (plan without execution)  
- Lessons learned write-back  

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

## Core Commands

```
/exec <command>
/audit
/ssh-audit <target>
/exec-task <task>
/exec-task explain <task>
```

---

## Execution Philosophy

- One command at a time  
- Read-only by default  
- No production writes  
- No destructive operations  
- Stop on mismatch  
- Validate before execution  
- Never hallucinate success  

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

JovoCoder is built on top of MemPalace.

MemPalace was created by Milla Jovovich & Ben Sigman and provides the memory layer.

JovoCoder adds execution, validation, and orchestration.

---

## Status

v0.2.0 — Execution Engine Release

This is the version where JovoCoder stops being an assistant  
and becomes an operator.
