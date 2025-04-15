#!/bin/bash
set -e

# Docker image must be set manually
IMAGE="ghdl/ghdl:6.0.0-dev-llvm-ubuntu-22.04"

# Check for image
if [ -z "$IMAGE" ]; then
    echo "[ERROR] No Docker image specified. Please set the IMAGE variable in the script."
    exit 1
fi

# Check for at least one VHDL file
if [ $# -lt 1 ]; then
    echo "Usage: $0 <file1.vhdl> [file2.vhdl ...] <testbench.vhdl>"
    exit 1
fi

# Collect files and get entity name from last one
FILES=("$@")
MAIN_FILE="${FILES[-1]}"
ENTITY=$(basename "$MAIN_FILE")
ENTITY="${ENTITY%.*}"

# Cleanup function
cleanup() {
    echo "[INFO] Cleaning up generated files..."
    rm -f "$ENTITY" *.o *.cf work-obj*.cf || true
}
trap cleanup EXIT

# Analyze all files
for file in "${FILES[@]}"; do
    echo "[INFO] Analyzing $file..."
    docker run --rm -v "$PWD":/src -w /src "$IMAGE" ghdl -a "$file"
done

# Elaborate
echo "[INFO] Elaborating $ENTITY..."
docker run --rm -v "$PWD":/src -w /src "$IMAGE" ghdl -e "$ENTITY"

# Run simulation
echo "[INFO] Running simulation for $ENTITY..."
docker run --rm -v "$PWD":/src -w /src "$IMAGE" ghdl -r "$ENTITY"
