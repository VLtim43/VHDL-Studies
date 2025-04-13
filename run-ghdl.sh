#!/bin/bash
set -e

# Docker image must be set manually
IMAGE="ghdl/ghdl:6.0.0-dev-llvm-ubuntu-22.04"

# Check for image
if [ -z "$IMAGE" ]; then
    echo "[ERROR] No Docker image specified. Please set the IMAGE variable in the script."
    exit 1
fi

# Check for VHDL file argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <file.vhd>"
    exit 1
fi

FILE="$1"

# Validate file
if [ ! -f "$FILE" ]; then
    echo "[ERROR] File '$FILE' not found."
    exit 1
fi

# Extract entity name (filename without extension)
ENTITY=$(basename "$FILE" .vhd)

# Run GHDL flow
docker run --rm -v "$PWD":/src -w /src "$IMAGE" ghdl -a "$FILE"
docker run --rm -v "$PWD":/src -w /src "$IMAGE" ghdl -e "$ENTITY"
docker run --rm -v "$PWD":/src -w /src "$IMAGE" ghdl -r "$ENTITY"

# Cleanup
rm -f "$ENTITY" *.o *.cf work-obj*.cf
