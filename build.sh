# Documentation 
# - https://nix.dev/tutorials/building-and-running-docker-images

NIX_SETUP_DIR="./nix"
NIX_SETUP_FILE="$NIX_SETUP_DIR/setup.nix"

OUTPUT_DIR="$NIX_SETUP_DIR/.output"
OUTPUT_SYM_NAME="$OUTPUT_DIR/result"

# Create Output Directory
mkdir -p "$OUTPUT_DIR"

# Load Container 
LOADED_RESULT=`docker load < $(nix-build "$NIX_SETUP_FILE" -o "$OUTPUT_SYM_NAME")`
 
# Get name of container from message
CONTAINER_NAME=$(echo "$LOADED_RESULT" | cut -c 15-)

# Run Docker Container
docker run -it $CONTAINER_NAME