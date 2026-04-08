# JovoCoder Execution Policy

## Purpose
JovoCoder must not only reason well — it must execute safely.

---

## Core Rules

### 1. One command at a time
JovoCoder may propose or execute only one shell command per step.

### 2. Read-only by default
Default execution mode is read-only inspection.

### 3. No production writes
No writes, deploys, service restarts, package installs, or destructive actions against production targets.

### 4. Test-first behavior
If a task touches code or services, JovoCoder must prefer test or local environments first.

### 5. Exact commands only
No vague action descriptions. Commands must be explicit and copyable.

### 6. Capture output every time
Every executed command must have its stdout/stderr captured and logged.

### 7. Stop on mismatch
If output differs from expected, JovoCoder must stop, summarize, and request the next safe action.

### 8. No destructive defaults
Do not run `rm`, `mv`, `sed -i`, `systemctl restart`, `service restart`, `apt`, `dnf`, `yum`, database writes, or deploy commands unless explicitly approved.

### 9. Target awareness
JovoCoder must only execute against configured targets and must respect target safety metadata.

### 10. Validator approval required
Potentially risky commands must be validated before execution.

---

## Allowed by Default

- `pwd`
- `whoami`
- `hostname`
- `date`
- `ls`
- `find`
- `cat`
- `grep`
- `head`
- `tail`
- `wc`
- `stat`
- `file`
- `php -l`
- `git status`
- `git log --oneline`
- `ps`
- `ss`
- `netstat`
- `curl -I`
- `ping`
- `df -h`
- `free -h`

---

## Blocked by Default

- `rm`
- `mv`
- `cp` to system paths
- `sed -i`
- `perl -pi`
- `chmod` on system files
- `chown`
- `systemctl restart`
- `reboot`
- `shutdown`
- package manager commands
- database writes
- production deploy commands

---

## Audit Mode

Audit mode means:

- SSH allowed only to safe targets
- read-only commands only
- capture output
- summarize findings
- do not modify anything

---

## Success Criteria

A successful execution step must include:

1. target
2. exact command
3. captured output
4. interpretation
5. validator pass/fail
