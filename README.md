<p align="center">
  <img src="docs/jovocoder-source.png" alt="JovoCoder Logo" width="300"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-0.1.0-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/local--first-yes-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/no%20api-required-blueviolet?style=for-the-badge" />
  <img src="https://img.shields.io/badge/license-MIT-green?style=for-the-badge" />
</p>

# JovoCoder

A local-first AI runtime that **doesn’t just remember — it works.**

Built on top of MemPalace by Milla Jovovich & Ben Sigman. Their release of this gave me the breakthrough moment layer that I needed to create an open source completely non-API required orchestrator with full features and it's free. Thank you for the inspiration and breakthrough Ben and Milla. Get it here, you need it to run JovoCoder. https://github.com/milla-jovovich/mempalace

---

## The Breakthrough

I didn’t set out to build another AI tool. In fact, I had been fooling around with trying to build something like this for a few weeks. I was stuck at the memory layer, which is frankly one of the most important parts. Having to explain myself over and over again every time I went to work on this massive stack that I've developed for my publishing companies was extremely frustrating.

Then I found MemPalace.

It was a Eureka moment.

MemPalace gave me perfect recall.

What it didn’t give me was:

- a way to act on that memory  
- a way to enforce rules  
- a way to keep work moving forward without resetting  

So I built the missing layer on top of it and connected it to my fully local Ollama stack.

---

## The Problem

You finally get an AI to understand your system.

Then it forgets.

It ignores rules.  
It drifts.  
It breaks things.  
It restores things it shouldn’t.  
It goes off on its own.

And when it gets far enough off track, you have no choice but to start over.

Every. Single. Time.

---

Even worse:

- You repeat the same instructions constantly  
- You fight hallucinated “success”  
- You lose debugging context  
- You pay for tokens just to re-explain your own system  

---

## MemPalace Solves Memory

MemPalace is the first system that actually fixed memory issues enough to make this possible:

- stores everything  
- retrieves intelligently  
- runs locally  
- no API required  

It is the foundation.

---

## The Missing Layer

Memory alone is not enough.

You still need:

- execution  
- workflow  
- control  

That’s what JovoCoder adds.

---

## JovoCoder

JovoCoder turns memory into action.

It adds:

- agent roles (planner / coder / validator)  
- persistent task tracking  
- memory write-back  
- safe refinement loops  
- a real working CLI  

---

## What This Changes

Instead of:

prompt → guess → forget

You now have:

memory → retrieval → reasoning → validation → continuity

---

## How It Works

MemPalace → memory + retrieval  
JovoCoder → orchestration + workflow  
Ollama → local model execution  

---

## Features

- Local-first (no cloud required)  
- Zero API by default  
- Persistent memory and tasks  
- Verifiable workflows  
- No hallucinated success  
- Multi-role reasoning (planner / coder / validator)  
- CLI-based agent runtime  

---

## Install

```bash
bash scripts/install.sh
bash scripts/verify.sh

---

## Run

jovocoder  

---

/help
/add TASK
/tasks
/done ID
/remember NOTE
/memory
/resume
/handoff
/next
/autoloop TASK
/exec
/audit
/ssh-audit
/exec-task

---

Optional: Auto-Launch on SSH Login

If you want JovoCoder to start automatically when you SSH into a system:
echo '
# auto-start jovocoder for interactive ssh
if [[ $- == *i* ]]; then
  if command -v jovocoder >/dev/null 2>&1; then
    jovocoder
    exit
  fi
fi
' >> ~/.bashrc

To bypass auto-launch and get a normal shell:
ssh -t user@host "bash --noprofile --norc"
---

## Models

Default role mapping:
	•	Planner → llama3.1:8b
	•	Coder → codellama:13b-instruct
	•	Validator → gemma4:26b
---

## Philosophy
	•	Local-first
	•	Deterministic behavior
	•	Explicit memory
	•	Controlled execution
	•	No hallucinated success 

---

## Attribution

JovoCoder is built on top of MemPalace.

MemPalace was created by Milla Jovovich & Ben Sigman and is used here as the memory and retrieval layer.

This project does not modify MemPalace itself — it adds an orchestration and execution layer on top of it.

MemPalace is used in accordance with its open source license.
---

## Status

v0.1.0 — Initial public release
