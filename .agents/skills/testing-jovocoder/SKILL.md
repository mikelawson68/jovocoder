---
name: testing-jovocoder
description: Test the jovocoder CLI tool end-to-end. Use when verifying audit functionality, memory system, or MemPalace integration changes.
---

# Testing jovocoder

## Overview

jovocoder is a ~3100-line bash CLI tool (`bin/jovocoder`) for running read-only SSH audits with safety validation. No build step — just bash.

## Environment Requirements

- **Apache2** and **PHP** installed and running (for Apache/PHP audit targets)
- **SSH server** running with passwordless localhost access (key-based)
- **ollama** installed (required at startup, line 38)
- **python3** installed (required at startup, line 39)
- **ripgrep** (`rg`) for memory search
- **jq** for JSON parsing

## SSH Target Config

Create `config/ssh_targets.local.json` from the template `config/ssh_targets.json`. For local testing:

```json
{
  "targets": {
    "example-target": {
      "host": "localhost",
      "user": "ubuntu",
      "port": 22,
      "safe": true,
      "environment": "local",
      "notes": "Local test target for Apache/PHP audit"
    }
  }
}
```

Targets must have `"safe": true` or they will be rejected by the validator.

## How to Run an Audit

```bash
echo "/exec-task apache php audit example-target" | \
  JOVOCODER_SSH_TARGETS_FILE=config/ssh_targets.local.json \
  bash bin/jovocoder 2>&1
```

The `JOVOCODER_SSH_TARGETS_FILE` env var overrides the default config path (which points to `$HOME/jovocoder/config/ssh_targets.local.json`).

## Expected Audit Output

A successful audit produces:
```
AUDIT SUMMARY:
Target: example-target
Host: <hostname>
Apache: <version>
PHP: <version>
HTTP: 200
Status: PASS
```

If routing is broken, you'll see: `[validator] FAIL: no deterministic execution path for this task yet`

## Syntax Check

```bash
bash -n bin/jovocoder && echo "SYNTAX OK"
```

## Key Testing Patterns

### Memory System
- Native memory lives at `~/.jovocoder/memory/` (subdirs: session, operational, knowledge, reflections)
- Lessons are logged to `~/.mempalace/lessons.log`
- MemPalace is optional — when not installed, `memory_backend_available()` returns false and all MemPalace calls are skipped
- The default backend mode is `fallback_to_native_if_mempalace_missing`

### MemPalace Integration
- MemPalace CLI commands used: `mempalace mine <dir> --wing <name>` (ingest) and `mempalace search <query> --wing <name>` (retrieval)
- The wing constant is `JOVOCODER_MEMPALACE_WING="jovocoder"` (line 16)
- `memory_mine_to_mempalace()` syncs native store to MemPalace after audits/workflows — silently no-ops when MemPalace is absent
- To verify MemPalace calls are correct, grep for `mempalace search` and confirm all use `--wing` flag
- Old broken commands (`mempalace put/get/append`) should NOT exist — grep to verify

### Testing Without MemPalace
- Most testing can be done without MemPalace installed — the native fallback handles everything
- Verify no sync messages appear: output should NOT contain `[memory] syncing native store to MemPalace`
- To test WITH MemPalace: `pip install mempalace` or `uv tool install mempalace`

### Input Routing
- The script accepts input via stdin (pipe) or CLI args or interactive prompt
- `dispatch_task()` routes `/exec-task *` to `exec_task()`
- Single-target Apache/PHP audits match: contains "apache" AND "php" AND NOT "all"

## Devin Secrets Needed

None — all testing is local with localhost SSH.
