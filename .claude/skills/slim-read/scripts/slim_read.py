#!/usr/bin/env python3
"""Focused file structure and symbol extraction for Claude Frugal."""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


@dataclass(frozen=True)
class Entry:
    kind: str
    name: str
    line: int
    indent: int


PY_PATTERN = re.compile(r"^(?P<indent>\s*)(?:async\s+def|def|class)\s+(?P<name>[A-Za-z_][\w]*)\b")
JS_PATTERNS = [
    re.compile(r"^(?P<indent>\s*)export\s+(?:async\s+)?function\s+(?P<name>[A-Za-z_$][\w$]*)\b"),
    re.compile(r"^(?P<indent>\s*)export\s+class\s+(?P<name>[A-Za-z_$][\w$]*)\b"),
    re.compile(r"^(?P<indent>\s*)(?:async\s+)?function\s+(?P<name>[A-Za-z_$][\w$]*)\b"),
    re.compile(r"^(?P<indent>\s*)class\s+(?P<name>[A-Za-z_$][\w$]*)\b"),
    re.compile(r"^(?P<indent>\s*)(?:export\s+)?const\s+(?P<name>[A-Za-z_$][\w$]*)\s*="),
]
MD_PATTERN = re.compile(r"^(?P<marks>#{1,6})\s+(?P<name>.+?)\s*$")
RANGE_PATTERN = re.compile(r"^(?P<start>\d+)-(?P<end>\d+)$")


def read_lines(path: Path) -> list[str]:
    try:
        return path.read_text(encoding="utf-8").splitlines()
    except UnicodeDecodeError:
        return path.read_text(errors="replace").splitlines()


def detect_entries(lines: list[str]) -> list[Entry]:
    entries: list[Entry] = []
    for idx, line in enumerate(lines, start=1):
        py_match = PY_PATTERN.match(line)
        if py_match:
            keyword = "class" if "class " in line.lstrip()[:8] else "function"
            entries.append(Entry(keyword, py_match.group("name"), idx, len(py_match.group("indent"))))
            continue

        for pattern in JS_PATTERNS:
            js_match = pattern.match(line)
            if js_match:
                stripped = line.lstrip()
                kind = "class" if stripped.startswith(("class ", "export class ")) else "function"
                entries.append(Entry(kind, js_match.group("name"), idx, len(js_match.group("indent"))))
                break
        else:
            md_match = MD_PATTERN.match(line)
            if md_match:
                level = len(md_match.group("marks"))
                entries.append(Entry(f"heading{level}", md_match.group("name"), idx, level - 1))
    return entries


def format_structure(path: Path, entries: Iterable[Entry]) -> str:
    items = list(entries)
    if not items:
        return f"{path}: no supported symbols or headings found."

    lines = [f"{path}: structure"]
    for entry in items:
        prefix = "  " * min(entry.indent, 4)
        lines.append(f"{prefix}- line {entry.line}: {entry.kind} {entry.name}")
    return "\n".join(lines)


def clamp_range(start: int, end: int, total: int) -> tuple[int, int]:
    start = max(1, min(start, total))
    end = max(start, min(end, total))
    return start, end


def extract_range(path: Path, lines: list[str], start: int, end: int) -> str:
    start, end = clamp_range(start, end, len(lines))
    excerpt = "\n".join(f"{line_no:>5}  {lines[line_no - 1]}" for line_no in range(start, end + 1))
    return f"{path}:{start}-{end}\n{excerpt}"


def find_symbol_extent(lines: list[str], entries: list[Entry], target: str) -> tuple[int, int] | None:
    match = next((entry for entry in entries if entry.name == target), None)
    if match is None:
        lowered = target.lower()
        match = next((entry for entry in entries if entry.name.lower() == lowered), None)
    if match is None:
        return None

    start = match.line
    next_peer = next(
        (
            entry.line
            for entry in entries
            if entry.line > start and entry.indent <= match.indent and entry.kind.startswith(("function", "class", "heading"))
        ),
        len(lines) + 1,
    )
    end = max(start, next_peer - 1)

    while end > start and not lines[end - 1].strip():
        end -= 1

    return start, end


def run(path: Path, target: str | None) -> int:
    if not path.exists():
        print(f"error: file not found: {path}", file=sys.stderr)
        return 2
    if not path.is_file():
        print(f"error: not a file: {path}", file=sys.stderr)
        return 2

    lines = read_lines(path)
    if not lines:
        print(f"{path}: empty file")
        return 0

    entries = detect_entries(lines)
    if not target:
        print(format_structure(path, entries))
        return 0

    range_match = RANGE_PATTERN.match(target)
    if range_match:
        start = int(range_match.group("start"))
        end = int(range_match.group("end"))
        print(extract_range(path, lines, start, end))
        return 0

    extent = find_symbol_extent(lines, entries, target)
    if extent is None:
        print(f"{path}: target not found: {target}")
        print()
        print(format_structure(path, entries))
        return 1

    print(extract_range(path, lines, *extent))
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Inspect file structure or extract one focused target.")
    parser.add_argument("file", help="File to inspect")
    parser.add_argument("--target", help="Symbol name or line range, for example TokenCalculator or 50-100")
    args = parser.parse_args()
    return run(Path(args.file), args.target)


if __name__ == "__main__":
    raise SystemExit(main())
