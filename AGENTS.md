# Multi-Agent Operating Guide

## Roles and Responsibilities

### Planner
- **Focus**: Establish implementation strategy for features and documentation updates.
- **Primary files**: `PLAN.md`, `TODO`, top-level docs under `docs/`.
- **Hand-off**: Deliver a written plan highlighting scope, risks, and sequencing before coding begins; share explicit TODOs for the Implementer and Data Curator.

### Ruby Implementer
- **Focus**: Modify Ruby source under `lib/` and scripts in `bin/` to realize planned gameplay changes.
- **Primary files**: `lib/*.rb`, `bin/game_player.rb`, supporting test files under `tests/`.
- **Hand-off**: Provide diffs with inline notes for QA, summarize behavior changes, and flag any new data dependencies for the Data Curator.

### Data Curator
- **Focus**: Maintain YAML content and ensure game data aligns with engine expectations.
- **Primary files**: `data/epic_adventure/*.yml`, future inventory/state configuration files.
- **Hand-off**: Validate YAML integrity, document schema adjustments, and notify the Implementer/QA about new items or room states that require code/test coverage.

### QA / Test Runner
- **Focus**: Verify automated tests and perform smoke checks of the interactive game loop.
- **Primary files**: `tests/*.rb`, execution scripts (`play.sh`).
- **Hand-off**: Report test results with command outputs, capture observed regressions, and confirm that updated documentation remains accurate.

## Shared Workflow Checklist
1. **Discover & Align**
   - Review `PROMPT.md`, `PLAN.md`, and relevant files.
   - Inspect Ruby sources under `lib/` and YAML in `data/epic_adventure/`.
2. **Implement**
   - Follow the Planner's breakdown.
   - Update Ruby or YAML files according to role-specific duties.
3. **Test**
   - Run unit tests with `rake test`.
   - Perform a manual smoke test via `ruby play.sh` (terminates with `exit` or `quit`).
4. **Review & Document**
   - Cross-check changes against documentation and TODO items.
   - Ensure commits reference impacted subsystems and data updates.

## Known Constraints & Forward-Looking Requirements
- Source files are ASCII; maintain encoding and avoid binary assets.
- Game state depends heavily on YAML-defined rooms, messages, and items.
- The command parser only understands `go <direction>`, `look`, `help`, `exit`, and `quit`.
- The engine REPL loops indefinitely; always provide an exit path when testing.
- `data/epic_adventure/items.yml` is present but unused—future work must introduce an inventory system that loads and manipulates these items.
- Room descriptions remain static; upcoming features must support room state persistence so descriptions or available actions change after interactions.
- The `TODO` file captures roadmap ideas (inventory, grammar improvements, NPCs, level editor); reference it when planning incremental deliveries.
