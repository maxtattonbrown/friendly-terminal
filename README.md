# Friendly Terminal

A terminal for everyone.

![Friendly Terminal preview — warm parchment background with a coffee mug, welcome message, and colour palette](screenshot.png)

## Quick install

Paste this into your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/maxtattonbrown/friendly-terminal/main/install.sh | bash
```

It detects your terminal and installs the theme. On Mac Terminal, it applies instantly.

Want the full beginner-friendly setup (theme + statusline + plugins)? Try [Claude Code: Easy Mode](https://claudecodecurious.com/claude-code-easy-mode/).

## Why I made this

The terminal intimidates people. But there's essentially no difference between the terminal and the AI chat apps everyone already uses — there's a bit where you type, and there's a bit where the AI responds.

Except there is one difference: the deep black background and white text sends a message. THIS IS NOT FOR YOU. THIS IS FOR HACKERS IN MOVIES FROM THE 90s.

So I made this — a theme with a warm background, soft text, and coral emphasis. Just like the desktop [Claude](https://claude.ai) app.

My hope is that this makes it easier for more people to jump into [Claude Code](https://docs.anthropic.com/en/docs/claude-code) and get the value it can offer.

## Which terminal do I have?

If you've never installed a terminal app, you're using the one that came with your computer:

- **Mac** → Terminal (it's in Applications → Utilities → Terminal)
- **Windows** → Windows Terminal (from the Microsoft Store, or the older Command Prompt)

If you deliberately installed something like Ghostty, iTerm2, or Warp — you'll know.

## Mac Terminal (start here)

This is what most people need.

1. **Download the file**: click [`Friendly Terminal.terminal`](Friendly%20Terminal.terminal) above, then click the download button (↓) on the right
2. **Double-click it** — Terminal opens and imports the theme
3. **Make it your default**: Terminal → **Settings** → **Profiles** → select "Friendly Terminal" → click **Default**

Done. New windows use the warm theme from now on.

## Other terminals

### Ghostty

```sh
cp friendly-terminal-ghostty ~/.config/ghostty/themes/friendly-terminal
```

Add to `~/.config/ghostty/config`:

```
theme = friendly-terminal
```

### iTerm2

**Settings** → **Profiles** → **Colors** → **Color Presets...** → **Import...** → pick `Friendly Terminal.itermcolors`.

### Warp

```sh
cp friendly-terminal-warp.yaml ~/.warp/themes/
```

Then **Settings** → **Appearance** → **Themes** → "Friendly Terminal".

### Kitty

```sh
mkdir -p ~/.config/kitty/themes
cp friendly-terminal-kitty.conf ~/.config/kitty/themes/
```

Add to `~/.config/kitty/kitty.conf`:

```
include themes/friendly-terminal.conf
```

### Alacritty

Add to your `~/.config/alacritty/alacritty.toml`:

```toml
[general]
import = ["~/path/to/friendly-terminal-alacritty.toml"]
```

### Windows Terminal

**Settings** → **Open JSON file** → paste the contents of `friendly-terminal-windows.json` into the `schemes` array → select "Friendly Terminal" in your profile.

## The colours

| | What | Hex |
|---|---|---|
| ◼ | background (parchment) | `#F5F0E8` |
| ◼ | text (dark brown) | `#2D2B26` |
| ◼ | cursor (coral) | `#DA7756` |
| ◼ | selection (sand) | `#DDD1C0` |
| ◼ | red (brick) | `#B5432E` |
| ◼ | green (forest) | `#3E7A4F` |
| ◼ | blue (denim) | `#3A6090` |
| ◼ | yellow (amber) | `#86650F` |
| ◼ | magenta (plum) | `#7A4D72` |
| ◼ | cyan (teal) | `#2D7070` |

The bright red is the same coral as the cursor — it's the one bit of personality that comes through everywhere.

## Credits

Made by [Max Tatton-Brown](https://github.com/maxtattonbrown), founder of [Claude Code Curious](https://claudecodecurious.com).
