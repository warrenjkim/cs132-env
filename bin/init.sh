BIN_DIR="$(dirname "$(realpath "$0")")"

echo "Prepending $PWD/bin to \$PATH..."
echo

export PATH="$PWD/bin:$PATH"
echo "\$PATH is now $PATH"
echo

echo "============================"
echo "Starting docker container..."
echo "============================"
$(cd "$BIN_DIR/docker" && docker compose up -d)
echo "============================"
echo "Notes"
echo "============================"
echo "* To start/stop the container, run"
echo "      cmd start/stop"
echo
echo "* To run a gradle command in the container, run"
echo "      cmd [your gradle command here] [your project folder]"
echo
echo "  e.g. If your project folder is named 'hw1',"
echo "           cmd test hw1"
echo "       will run"
echo "           cd hw1 && gradle test"
echo "       in the container"
