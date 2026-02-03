# Karabiner-Elements Configuration

Custom keyboard remapping configurations for macOS using [Karabiner-Elements](https://karabiner-elements.pqrs.org/).

## Features

### Emacs Key Bindings (`emacs.json`)

Comprehensive Emacs-style keyboard shortcuts for macOS applications:

- **C-x prefix commands**: File operations, window management
  - `C-x 0` — Close window
  - `C-x C-c` — Quit application
  - `C-x C-f` — Open file
  - `C-x C-s` — Save file
  - `C-x u` — Undo

- **Mark mode & selection**: Visual selection with Emacs-style navigation
  - `C-@` (`C-Shift-2`) — Toggle mark mode
  - Navigation keys extend selection while mark mode is active

- **Cursor navigation**:
  - `C-f/b/n/p` — Forward/backward/next/previous character/line
  - `C-a/e` — Beginning/end of line
  - `M-f/b` — Forward/backward word
  - `M-</> ` — Beginning/end of document

- **Text editing**:
  - `C-d` — Delete forward
  - `C-h` — Delete backward
  - `C-k` — Kill to end of line
  - `C-w` — Kill region
  - `M-w` — Copy region
  - `C-y` — Yank (paste)

- **Other**:
  - `C-g` — Cancel / escape
  - `C-m` — Return
  - `C-z` — Undo
  - `C-/` — Undo

Terminal applications (Terminal.app, iTerm2, WezTerm, Alacritty, etc.) and editors with native Emacs support are automatically excluded.

### IME Integration (`ime.json`)

Special handling for Japanese Input Method Editor:

- `C-k` sends Return and clears mark mode during Japanese input
- Prevents conflicts between Emacs bindings and IME operations

### Application Shortcuts (`cursor.json`)

Single-key navigation for media applications:

**VLC / Kindle:**
- `[` / `/` — Up/down navigation
- `;` / `'` — Left/right navigation
- `]` / `p` — Next/previous chapter (VLC)

### Command Key Remapping (`command.json`)

Alternative key mappings for English keyboard layout:

- `⌘W` → `⌘C` (Copy instead of close, when English input is active)
- `⌘⇧⌥⌃W` → `⌘W` (Access original close window)

### Mouse Button Control (`disable-mouse.json`)

Disables mouse buttons during Japanese IME input to prevent accidental clicks while composing text (designed for Keyball keyboards).

## Installation

1. Install [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

2. Copy configuration files to the Karabiner complex modifications directory:
   ```bash
   cp assets/complex_modifications/*.json ~/.config/karabiner/assets/complex_modifications/
   ```

3. Open Karabiner-Elements → Complex Modifications → Add Rule

4. Enable the desired rules

## File Structure

```
assets/complex_modifications/
├── emacs.json          # Emacs key bindings (main configuration)
├── ime.json            # Japanese IME integration
├── cursor.json         # App-specific shortcuts (VLC, Kindle)
├── command.json        # Command key alternatives
└── disable-mouse.json  # Mouse control for Keyball
```

## Version Tracking

Each rule includes a revision number in its description (e.g., `rev 12+4` or `Rev.1`) to track configuration history.

## License

MIT
