# Demo Tools

This directory contains small demos for Claude Frugal.

## Token Calculator

Run the theoretical model:

```bash
python3 demo/token-calculator.py --all
```

Run one scenario:

```bash
python3 demo/token-calculator.py --scenario api-development
```

Export JSON:

```bash
python3 demo/token-calculator.py --scenario bug-investigation --json
```

The output is a model, not validated real-world evidence.

## Interactive Demo

```bash
bash demo/interactive-demo.sh
```

The shell demo shows the intended workflow:

1. Use `slim-read` for targeted file inspection.
2. Use `limit-watch` to estimate context size.
3. Use `distill` before `/compact`.

## Validation Note

If demo results differ from the README or tests, treat the tests and calculator
output as source of truth and update this file.
