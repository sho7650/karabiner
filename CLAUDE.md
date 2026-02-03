# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Karabiner-Elements keyboard remapping configuration repository for macOS. It contains complex modification rules for:
- Emacs-style key bindings with mark mode, kill ring, and yank support
- IME (Input Method Editor) aware keybindings for English/Japanese switching
- Application-specific shortcuts (VLC, Kindle, terminals)
- Custom cursor navigation and mouse control

## Repository Structure

```
assets/complex_modifications/   # Karabiner JSON configuration files
  emacs.json                    # Comprehensive Emacs keybindings (main file)
  ime.json                      # Japanese IME integration
  cursor.json                   # App-specific cursor navigation
  command.json                  # Alternate Command/Option mappings
  disable-mouse.json            # Mouse button control during IME
.claude/commands/               # Claude Code workflow commands
```

## Configuration Format

Karabiner complex modifications use this structure:

```json
{
  "title": "Rule Set Name",
  "rules": [{
    "description": "Description (rev X+Y)",
    "manipulators": [{
      "type": "basic",
      "from": { "key_code": "...", "modifiers": {...} },
      "to": [{ "key_code": "..." }],
      "conditions": [{ "type": "...", "input_sources": [...] }]
    }]
  }]
}
```

Key patterns:
- **Conditions**: Filter by input language (`^en$`, `^ja$`), app bundle ID, or variable state
- **Variables**: Track state (e.g., `"C-x": true` for prefix commands, `"Mark": true` for selection mode)
- **Revision tracking**: Descriptions include `(rev X+Y)` or `(Rev.X)` for version history

## Common Modifications

When editing rules:
1. Track revision numbers in rule descriptions
2. Use `frontmost_application_unless` for terminal exclusions (bundle IDs like `com.github.wez.wezterm`)
3. Test language conditions with appropriate `input_source_id` patterns
4. Use `set_notification_id` for visible mode indicators

## Release Workflow

Use `/release` command which follows conventional commits:
- Commit types: feat, fix, docs, style, refactor, chore, etc.
- Branch naming: `{type}/{slug}` format
- Never use `git add -A` - stage specific files only
- Exclude sensitive files (.env, credentials, tokens)
