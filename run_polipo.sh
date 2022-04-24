#!/usr/bin/env bash


# For arch linux, the 'polipo' package used to be available in the aur. 
# Here's the google's cache link: 
#     https://webcache.googleusercontent.com/search?q=cache:M_3A8oGIFx8J:https://aur.archlinux.org/packages/polipo-git+&cd=2&hl=en&ct=clnk&gl=co&client=firefox-b-d

set -e

# Works even with symlinks in path
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
CACHE_DIR="/tmp/cache/polipo"
CONF_FILE_NAME="polipo.conf"

CONF_FILE_CONTENT=$(cat << EOF
diskCacheRoot=$CACHE_DIR
proxyAddress="0.0.0.0"
logLevel=4

EOF
)

echo "$CONF_FILE_CONTENT" > "$SCRIPT_DIR"/$CONF_FILE_NAME

mkdir -p $CACHE_DIR
polipo -c "$SCRIPT_DIR"/$CONF_FILE_NAME

