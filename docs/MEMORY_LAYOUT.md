# JovoCoder Memory Layout

## Purpose
JovoCoder needs structured memory, not one undifferentiated blob.

---

## Layers

### 1. Identity
Who the user is, what the system is, and how it should behave.

Examples:
- owner identity
- primary mission
- operating style
- non-negotiable constraints

### 2. Canon
Hard rules the system must follow every time.

Examples:
- METHODICAL
- REDLINE
- REGROUP
- ISOLATE
- no hallucinated success
- QBO is source of truth

### 3. Project Facts
Stable facts about the current project or environment.

Examples:
- repo paths
- hostnames
- target environments
- framework and stack facts
- known working commands

### 4. Open Tasks
Current work that is not complete yet.

Examples:
- build eval runner
- add execution loop
- wire ssh target config
- harden validator

### 5. Recent Context
Short-term running context from the latest session history.

Examples:
- recent commands
- recent findings
- recent decisions
- current branch of work

### 6. Validated Lessons Learned
Corrections and proven operational knowledge.

Examples:
- what failed and why
- what worked and why
- commands that are known-safe
- commands that caused breakage
- repeated anti-patterns

---

## Design Rules

### Keep stable and unstable memory separate
Identity, canon, and project facts should not be mixed with volatile session chatter.

### Lessons learned must be earned
Only validated outcomes should enter the lessons-learned layer.

### Open tasks must stay visible
Open tasks should always be included in task-aware responses.

### Recent context must stay short
Recent context should provide continuity without flooding the model.

### Canon outranks everything
If recent context conflicts with canon, canon wins.

---

## Recommended Runtime Order

When building prompt context, prefer this order:

1. identity
2. canon
3. project facts
4. open tasks
5. validated lessons learned
6. recent context
7. long-term retrieval results

---

## Future Direction

JovoCoder should evolve toward:

- separate files for each memory layer
- controlled writes to lessons learned
- eval-backed promotion into validated memory
- task-aware retrieval
- target-aware execution memory
