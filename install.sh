#!/bin/bash
# ABOUTME: One-command installer for Friendly Terminal — detects your terminal and installs the warm theme.
# ABOUTME: Supports Terminal.app, iTerm2, Ghostty, Warp, Kitty, and Alacritty. Reversible.

set -e

G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
D='\033[0;90m'
R='\033[0m'

REPO_URL="https://raw.githubusercontent.com/maxtattonbrown/friendly-terminal/main"

echo ""
echo -e "  ${G}Friendly Terminal${R} — installing theme..."
echo ""

# Detect terminal
terminal="unknown"
terminal_name="your terminal"

if [[ -d "$HOME/.config/ghostty" ]]; then
  terminal="ghostty"
  terminal_name="Ghostty"
elif pgrep -xq "iTerm2" 2>/dev/null; then
  terminal="iterm2"
  terminal_name="iTerm2"
elif pgrep -xq "Warp" 2>/dev/null; then
  terminal="warp"
  terminal_name="Warp"
elif [[ -d "$HOME/.config/kitty" ]]; then
  terminal="kitty"
  terminal_name="Kitty"
elif [[ -d "$HOME/.config/alacritty" ]]; then
  terminal="alacritty"
  terminal_name="Alacritty"
elif [[ "$(uname)" == "Darwin" ]]; then
  terminal="terminal-app"
  terminal_name="Mac Terminal"
fi

echo -e "  ${D}Detected:${R} $terminal_name"

case "$terminal" in
  ghostty)
    mkdir -p "$HOME/.config/ghostty/themes"
    curl -fsSL "$REPO_URL/friendly-terminal-ghostty" > "$HOME/.config/ghostty/themes/friendly-terminal"
    echo -e "  ${G}✓${R} Theme installed"
    echo -e "  ${Y}→${R} Add ${C}theme = friendly-terminal${R} to ~/.config/ghostty/config"
    ;;
  iterm2)
    curl -fsSL "$REPO_URL/Friendly%20Terminal.itermcolors" > "/tmp/Friendly Terminal.itermcolors"
    open "/tmp/Friendly Terminal.itermcolors" 2>/dev/null || true
    sleep 1
    osascript -e 'tell application "iTerm2" to tell current session of current window to set color preset to "Friendly Terminal"' 2>/dev/null || true
    echo -e "  ${G}✓${R} Theme applied"
    ;;
  terminal-app)
    curl -fsSL "$REPO_URL/Friendly%20Terminal.terminal" > "/tmp/Friendly Terminal.terminal"
    open "/tmp/Friendly Terminal.terminal" 2>/dev/null || true
    sleep 1
    defaults write com.apple.Terminal "Default Window Settings" -string "Friendly Terminal" 2>/dev/null
    defaults write com.apple.Terminal "Startup Window Settings" -string "Friendly Terminal" 2>/dev/null
    osascript -e 'tell application "Terminal" to set current settings of front window to settings set "Friendly Terminal"' 2>/dev/null || true
    echo -e "  ${G}✓${R} Theme applied"
    ;;
  warp)
    mkdir -p "$HOME/.warp/themes"
    curl -fsSL "$REPO_URL/friendly-terminal-warp.yaml" > "$HOME/.warp/themes/friendly-terminal.yaml"
    echo -e "  ${G}✓${R} Theme installed"
    echo -e "  ${Y}→${R} In Warp: Settings → Appearance → Themes → friendly-terminal"
    ;;
  kitty)
    mkdir -p "$HOME/.config/kitty/themes"
    curl -fsSL "$REPO_URL/friendly-terminal-kitty.conf" > "$HOME/.config/kitty/themes/friendly-terminal.conf"
    echo -e "  ${G}✓${R} Theme installed"
    echo -e "  ${Y}→${R} Add ${C}include themes/friendly-terminal.conf${R} to ~/.config/kitty/kitty.conf"
    ;;
  alacritty)
    curl -fsSL "$REPO_URL/friendly-terminal-alacritty.toml" > "$HOME/.config/alacritty/friendly-terminal.toml" 2>/dev/null || \
    curl -fsSL "$REPO_URL/friendly-terminal-alacritty.toml" > "/tmp/friendly-terminal-alacritty.toml"
    echo -e "  ${G}✓${R} Theme downloaded"
    echo -e "  ${Y}→${R} Import it in your alacritty.toml"
    ;;
  *)
    echo -e "  ${Y}!${R} Couldn't detect your terminal"
    echo -e "    See ${C}github.com/maxtattonbrown/friendly-terminal${R} for manual install"
    ;;
esac

echo ""
echo -e "  ${D}Want the full beginner setup? Try Easy Mode:${R}"
echo -e "  ${C}claudecodecurious.com/claude-code-easy-mode${R}"
echo ""
