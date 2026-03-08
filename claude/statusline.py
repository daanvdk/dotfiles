#!/usr/bin/env python3
from datetime import datetime, timezone
import json
from pathlib import Path
from urllib.request import Request, urlopen
import subprocess
import sys
import time


def get_path(data, *keys, default):
    try:
        for key in keys:
            data = data[key]
    except KeyError:
        return default
    else:
        return data


input_data = json.load(sys.stdin)

usage_path = Path("/tmp/claude_usage_cache.json")

if usage_path.is_file() and time.time() - usage_path.stat().st_mtime < 60:
    with usage_path.open("r") as f:
        usage_data = json.load(f)
else:
    result = subprocess.run(
        ["security", "find-generic-password", "-s", "Claude Code-credentials", "-w"],
        check=True,
        capture_output=True,
    )
    token = json.loads(result.stdout)["claudeAiOauth"]["accessToken"]

    request = Request(
        "https://api.anthropic.com/api/oauth/usage",
        headers={
            "authorization": f"Bearer {token}",
            "anthropic-beta": "oauth-2025-04-20",
            "user-agent": "claude-code/2.0.32",
        },
    )

    with urlopen(request) as f:
        usage_data = json.load(f)

    with usage_path.open("w") as f:
        json.dump(usage_data, f)


model = get_path(input_data, "model", "display_name", default="Unknown model")

context_usage = get_path(input_data, "context_window", "used_percentage", default=0)

session_usage = get_path(usage_data, "five_hour", "utilization", default=0)
session_reset_at = get_path(usage_data, "five_hour", "resets_at", default=None)
if session_reset_at is not None:
    session_reset_at = datetime.fromisoformat(session_reset_at)

week_usage = get_path(usage_data, "seven_day", "utilization", default=0)
week_reset_at = get_path(usage_data, "seven_day", "resets_at", default=None)
if week_reset_at is not None:
    week_reset_at = datetime.fromisoformat(week_reset_at)


def show_usage(label, usage, reset_at):
    parts = [f"{label}: "]

    if usage is None:
        parts.append("-")
    else:
        if usage > 80:
            parts.append("\x1b[1;31m")
        elif usage > 60:
            parts.append("\x1b[1;33m")

        parts.append(f"{usage:.0f}%")

        if usage > 60:
            parts.append("\x1b[0m")

    if reset_at is not None:
        delta = reset_at - datetime.now(timezone.utc)
        hours, minutes = divmod(delta.seconds // 60, 60)

        if delta.days:
            parts.append(f" ({delta.days}d{hours}h{minutes}m)")
        elif hours:
            parts.append(f" ({hours}h{minutes}m)")
        else:
            parts.append(f" ({minutes}m)")

    return "".join(parts)


sections = [
    model,
    show_usage("context", context_usage, None),
    show_usage("session", session_usage, session_reset_at),
    show_usage("week", week_usage, week_reset_at),
]

print(" | ".join(sections))
