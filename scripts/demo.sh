#!/bin/bash
# ABOUTME: Displays a friendly ASCII art demo that shows off the Friendly Terminal colour palette.
# ABOUTME: Uses ANSI escape codes to render coloured text — run this after installing the theme to see it in action.

R='\033[0m'
BK='\033[0;30m'; RD='\033[0;31m'; GN='\033[0;32m'; YL='\033[0;33m'
BL='\033[0;34m'; MG='\033[0;35m'; CN='\033[0;36m'; WH='\033[0;37m'
BBK='\033[1;30m'; BRD='\033[1;31m'; BGN='\033[1;32m'; BYL='\033[1;33m'
BBL='\033[1;34m'; BMG='\033[1;35m'; BCN='\033[1;36m'; BWH='\033[1;37m'

# Box border piece
B="${BBK}│${R}"

# Every content line is exactly 50 visible chars between the left and right │
echo ""
echo -e "  ${BBK}┌──────────────────────────────────────────────────┐${R}"
printf "  ${B}%-50s${B}\n" ""
printf "  ${B}        ${BBK})  ) )${R}%-36s${B}\n" ""
printf "  ${B}       ${BBK}(  ( (${R}%-37s${B}\n" ""
printf "  ${B}       ${BRD}╭────────╮${R}%-33s${B}\n" ""
printf "  ${B}       ${BRD}│${BYL} ~~~~~~ ${BRD}│╮${R}  ${GN}Welcome to your terminal.${R}%-5s${B}\n" ""
printf "  ${B}       ${BRD}│${BYL} ~~~~~~ ${BRD}││${R}  ${BBK}It's friendlier than it looks.${R}${B}\n"
printf "  ${B}       ${BRD}│${BYL} ~~~~~~ ${BRD}│╯${R}%-32s${B}\n" ""
printf "  ${B}       ${BRD}╰────────╯${R}%-33s${B}\n" ""
printf "  ${B}%-50s${B}\n" ""
printf "  ${B}%-21s${BL}▸ ${CN}type a command${R}%-13s${B}\n" "" ""
printf "  ${B}%-21s${BL}▸ ${CN}press enter${R}%-16s${B}\n" "" ""
printf "  ${B}%-21s${BL}▸ ${CN}that's it${R}%-18s${B}\n" "" ""
printf "  ${B}%-50s${B}\n" ""
printf "  ${B}  ${BBK}────────────────────────────────────────────${R}%-4s${B}\n" ""
printf "  ${B}%-50s${B}\n" ""
printf "  ${B}  ${RD}██${R} ${GN}██${R} ${YL}██${R} ${BL}██${R} ${MG}██${R} ${CN}██${R}  ${BRD}██${R} ${BGN}██${R} ${BYL}██${R} ${BBL}██${R} ${BMG}██${R} ${BCN}██${R}%-12s${B}\n" ""
printf "  ${B}%-50s${B}\n" ""
echo -e "  ${BBK}└──────────────────────────────────────────────────┘${R}"
echo ""
echo -e "  ${BBK}Friendly Terminal · github.com/maxtattonbrown/friendly-terminal${R}"
echo ""
