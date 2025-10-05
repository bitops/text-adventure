# Development Guide

## Environment Setup
- Ensure Ruby is installed (MRI 2.6+ works with the current codebase).
- Bundler is optional; dependencies are limited to the Ruby standard library (`yaml`, `readline`).
- No linting tooling is configured.

## Running Tests and Checks
- Execute automated tests with `rake test`.
- Perform an interactive smoke test with `ruby play.sh` and exit via `quit` or `exit`.

## Project Structure
- `bin/game_player.rb`: CLI entry point that starts the adventure.
- `lib/`: Ruby classes (`Bootstrap`, `Game`, `Engine`, `InputController`, `Avatar`, `Room`, `GameDataLoader`).
- `data/epic_adventure/`: YAML data for rooms (`locations.yml`), player messaging (`messages.yml`), and items (`items.yml`).
- `tests/`: MiniTest coverage for core classes.
- `TODO`: Roadmap for upcoming features (inventory, parser improvements, NPCs, editor).

## Data Management
- `locations.yml` contains an array of rooms, each with `handle`, `desc`, `info`, directional `rooms`, and optional `items` fields.
- `messages.yml` holds simple key/value pairs for splash/help text.
- `items.yml` defines items with `handle`, `name`, and `description`, ready for future inventory integration.
- When adding rooms or items:
  - Maintain unique `handle` values so `GameDataLoader` can resolve connections.
  - Keep descriptions concise and ASCII-only.
  - Mirror new item handles inside room definitions where items should appear.
  - Document schema changes in `AGENTS.md` for the Data Curator.
- Plan for inventory state by associating items with rooms and, eventually, with the avatar.
- Anticipate room state persistence by tracking flags (e.g., `item_taken`) once the feature exists.

## Working Agreements
- Favor simple, expressive Ruby with clear method responsibilities.
- Use MiniTest for unit coverage; add tests alongside new behaviors.
- Validate inventory and room state changes with focused tests that assert message updates and avatar state transitions.
- Update documentation (`docs/architecture.md`, `docs/development.md`) when introducing new subsystems or data formats.
