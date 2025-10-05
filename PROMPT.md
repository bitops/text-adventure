# Scaffolding Prompt for `text-adventure`

You are an expert Ruby developer and technical writer tasked with generating all scaffolding that future coding agents need to work confidently in this repository.

## Project context you can rely on
- Runtime: Ruby (MiniTest for unit tests). Entry point script is `bin/game_player.rb`, invoked by `play.sh`.
- Gameplay flow: `bin/game_player.rb` builds a `Bootstrap`, which loads YAML data through `GameDataLoader`. `Bootstrap` wires a `Game` whose `Engine` runs a REPL loop, delegating parsed commands to an `InputController`. The controller manipulates an `Avatar` positioned in interconnected `Room` objects. YAML data under `data/epic_adventure/` defines rooms, messages, and items.
- Core responsibilities:
  - `Bootstrap`: load YAML, build `InputController`, surface splash message.
  - `GameDataLoader`: deserialize YAML into `Room` objects and stitch directional relationships.
  - `Avatar`: track current room, handle movement.
  - `InputController`: validate and execute commands (`go`, `look`, `help`, `exit`/`quit`).
  - `Engine`: REPL, prints current message, reads input via `Readline`, loops forever.
  - `Game`: light wrapper to start the engine.
- Current gaps: no inventory system despite `data/epic_adventure/items.yml`, and room descriptions never change after interactions. Future work must introduce an inventory with item pickup/use, plus room state updates (e.g., descriptions shifting after an item is collected).
- Tests live in `tests/` (MiniTest). `TODO` lists roadmap items (inventory, grammar, NPC state machine, level editor).

## Deliverables you must create
1. `AGENTS.md`
   - Outline a lightweight multi-agent plan tailored to this codebase.
   - Define at least four roles (e.g., Planner, Ruby Implementer, Data Curator, QA/Test Runner). For each role, describe responsibilities, key files they touch, and hand-off expectations.
   - Include a shared workflow checklist (discover code, implement, test, review) referencing the exact commands to run (`bundle exec rake test` if a Gemfile exists, otherwise `rake test`, plus `ruby play.sh` for manual smoke tests).
   - Capture known constraints (ASCII files, reliance on YAML data, command parser limitations, TODO backlog) and the new requirements for inventory management and room state persistence so future agents plan around them.

2. `docs/architecture.md`
   - Provide a concise system overview followed by *at least two* Mermaid diagrams embedding the repo’s structure:
     - **Component map** (`graph TD`) showing how `bin/game_player` → `Bootstrap` → `Game` → `Engine` → `InputController` → `Avatar`/`Room` → YAML data interrelate, with annotations for the planned inventory/state subsystems.
     - **Command evaluation sequence** (`sequenceDiagram`) walking through a `go north` input from Readline to avatar movement, including validation branches and callouts where inventory or room state updates would occur.
   - Explain data loading (location/message YAML), how room relationships are resolved, and current limitations (lack of inventory usage even though `items.yml` exists, static room descriptions).
   - Note extension points aligned with the TODO list (inventory system, richer parser, NPC state machine, editor) and spell out expected changes for inventory/state tracking.

3. `docs/diagrams/` assets
   - Save the Mermaid sources referenced above as standalone `.mmd` files (e.g., `component_map.mmd`, `command_sequence.mmd`) so diagrams can be regenerated.
   - Ensure the Markdown embeds link to these files and include fenced ```mermaid blocks so they render inline.

4. `docs/development.md`
   - Document repo setup assumptions (requires Ruby, optional bundler), commands to run tests, linting expectations (none currently—note this), and how to launch the game.
   - Summarize the data directory layout and how to add new rooms/messages/items safely, including how future inventory data should be structured and linked back to room state.
   - Provide a short “working agreements” section reiterating coding style (simple OO Ruby, MiniTest) and testing philosophy, with guidance for testing room state changes and inventory flows.

## Quality expectations
- Verify every statement against the current code and data; do not invent APIs.
- Keep everything ASCII, wrap at a readable width, and prefer concise paragraphs.
- Cross-reference files with relative paths so agents can navigate quickly.
- When describing commands, include them in backticks.
- Surface risks or gaps (e.g., infinite REPL loop, lack of command grammar, unreferenced items, room state not tracked) so future work can plan mitigations.

When you have produced all deliverables, double-check internal consistency (diagram text matches Markdown descriptions, file paths resolve) before presenting the results.
