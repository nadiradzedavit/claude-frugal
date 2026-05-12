# Roadmap

Last updated: 2026-05-12

Claude Frugal is in beta. The priority is proving which workflows are actually
helped before adding more features.

## Current Phase: Validation and Trust

- [x] Claude Code skill directory layout.
- [x] Installer works from a clone and from `curl | bash`.
- [x] `slim-read` helper for focused file inspection.
- [x] Project-specific CI tests.
- [ ] 5 beta reports from real Claude Code sessions.
- [ ] 10 beta reports across different languages and OSes.
- [ ] README updated with measured results.

## Next: Helper Quality

- Improve `slim-read` language support based on reports.
- Add tests for missed symbol patterns.
- Document known parser limitations.
- Consider tree-sitter only if the dependency is worth the install cost.

## Later: Workflow Automation

- Explore `batch-read` for multiple targeted excerpts.
- Explore better context estimation for `limit-watch`.
- Explore project handoff templates for `distill`.

## Non-Goals

- No guaranteed savings claims without real data.
- No complex runtime dependencies unless they clearly improve the workflow.
- No enterprise features before the individual developer workflow is validated.
