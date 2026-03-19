#!/usr/bin/env python3
# ABOUTME: Generates a macOS Terminal.app .terminal profile from the Friendly Terminal color palette.
# ABOUTME: Uses AppKit's NSKeyedArchiver to serialize NSColor objects in the format Terminal.app expects.

import plistlib
from AppKit import NSColor, NSKeyedArchiver, NSFont

def color_data(hex_color):
    """Convert a hex color string to NSKeyedArchiver-encoded NSColor data."""
    hex_color = hex_color.lstrip('#')
    r = int(hex_color[0:2], 16) / 255.0
    g = int(hex_color[2:4], 16) / 255.0
    b = int(hex_color[4:6], 16) / 255.0
    color = NSColor.colorWithCalibratedRed_green_blue_alpha_(r, g, b, 1.0)
    return bytes(NSKeyedArchiver.archivedDataWithRootObject_(color))

def font_data(name, size):
    """Convert a font name and size to NSKeyedArchiver-encoded NSFont data."""
    font = NSFont.fontWithName_size_(name, size)
    if font is None:
        font = NSFont.userFixedPitchFontOfSize_(size)
    return bytes(NSKeyedArchiver.archivedDataWithRootObject_(font))

# Friendly Terminal palette
palette = {
    'bg':      '#F5F0E8',
    'fg':      '#2D2B26',
    'cursor':  '#DA7756',
    'sel_bg':  '#DDD1C0',
    'sel_fg':  '#2D2B26',
    'black':   '#2D2B26',
    'red':     '#B5432E',
    'green':   '#3E7A4F',
    'yellow':  '#86650F',
    'blue':    '#3A6090',
    'magenta': '#7A4D72',
    'cyan':    '#2D7070',
    'white':   '#7A756B',
    'bright_black':   '#6B6455',
    'bright_red':     '#DA7756',
    'bright_green':   '#5A9A6A',
    'bright_yellow':  '#B8922D',
    'bright_blue':    '#5A83B5',
    'bright_magenta': '#9B6B8A',
    'bright_cyan':    '#4D8C8C',
    'bright_white':   '#DDD6CA',
}

# Terminal.app ANSI color key mapping (0-15)
ansi_order = [
    'black', 'red', 'green', 'yellow', 'blue', 'magenta', 'cyan', 'white',
    'bright_black', 'bright_red', 'bright_green', 'bright_yellow',
    'bright_blue', 'bright_magenta', 'bright_cyan', 'bright_white',
]

profile = {
    'name': 'Friendly Terminal',
    'type': 'Window Settings',

    # Colors
    'BackgroundColor': color_data(palette['bg']),
    'TextColor': color_data(palette['fg']),
    'TextBoldColor': color_data(palette['fg']),
    'CursorColor': color_data(palette['cursor']),
    'CursorTextColor': color_data(palette['bg']),
    'SelectionColor': color_data(palette['sel_bg']),
    'SelectionTextColor': color_data(palette['sel_fg']),

    # Font
    'Font': font_data('SFMono-Regular', 14),

    # Cursor
    'CursorType': 1,  # 0=block, 1=underline, 2=bar — bar not available, underline closest to calm
    'CursorBlink': False,

    # Window
    'WindowTitle': 'Friendly Terminal',
    'ShowWindowSettingsName': False,
    'rowCount': 30,
    'columnCount': 100,

    # Background opacity (1.0 = fully opaque)
    'BackgroundAlphaInactive': 1.0,

    # Shell
    'shellExitAction': 1,  # Close if clean exit
}

# Add ANSI colors
for i, name in enumerate(ansi_order):
    profile[f'ANSIColor{i}'] = color_data(palette[name])

# Write profile
output_path = '/Users/maxtb/Projects/friendly-terminal/Friendly Terminal.terminal'
with open(output_path, 'wb') as f:
    plistlib.dump(profile, f, fmt=plistlib.FMT_XML)

print(f'Generated: {output_path}')
