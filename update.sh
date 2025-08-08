#!/usr/bin/env bash
set -euo pipefail

# Resolve paths
ROOT_DIR="$( cd -- "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd )"
HL_SETUP="$ROOT_DIR/Codebase/Dependencies/HL-Setup/setup.sh"

# Check if HL-Setup exists and is executable
if [[ ! -x "$HL_SETUP" ]]; then
    echo "[ERROR] HL-Setup script not found or not executable:"
    echo "  $HL_SETUP"
    exit 1
fi

# Export an environment variable so HL-Setup knows this is an update
export HL_MODE="update"

# Forward all arguments (if any) to HL-Setup
exec "$HL_SETUP" "$@"
