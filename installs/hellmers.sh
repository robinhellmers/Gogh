#!/usr/bin/env bash

export PROFILE_NAME="Hellmers"

export COLOR_01="#002B36"           # Black (Host)
export COLOR_02="#DC322F"           # Red (Syntax string)
export COLOR_03="#056E32"           # Green (Command)
export COLOR_04="#B58900"           # Yellow (Command second)
export COLOR_05="#FFFFFF"           # Blue (Path)
export COLOR_06="#D33682"           # Magenta (Syntax var)
export COLOR_07="#2AA198"           # Cyan (Prompt)
export COLOR_08="#EEE8D5"           # White

export COLOR_09="#073642"           # Bright Black
export COLOR_10="#CB4B16"           # Bright Red (Command error)
export COLOR_11="#00A0FF"           # Bright Green (Exec)
export COLOR_12="#657B83"           # Bright Yellow
export COLOR_13="#839496"           # Bright Blue (Folder)
export COLOR_14="#6C71C4"           # Bright Magenta
export COLOR_15="#00C2C2"           # Bright Cyan
export COLOR_16="#FDF6E3"           # Bright White

export BACKGROUND_COLOR="#002B36"   # Background
export FOREGROUND_COLOR="#A8A8A8"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

apply_theme() {
    if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
      bash "${GOGH_APPLY_SCRIPT}"
    elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
      bash "${PARENT_PATH}/apply-colors.sh"
    elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
      bash "${SCRIPT_PATH}/apply-colors.sh"
    else
      printf '\n%s\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [ -z "${GOGH_NONINTERACTIVE+no}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
