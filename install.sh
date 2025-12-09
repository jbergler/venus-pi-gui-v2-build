#!/bin/sh

set -e

URL="https://github.com/jbergler/venus-pi-gui-v2-build/releases/download/${TAG:-latest}/venus-gui-v2.tar.gz"

# Download and extract
mkdir -p /opt/victronenergy/gui-v2
curl -fsSL "$URL" | tar -xz -C /opt/victronenergy/gui-v2

# Ensure dependencies are installed
opkg update
opkg install $(opkg depends -A gui-v2 | grep -v 'depends on:' | cut -d' ' -f1)
opkg install start-gui-v2

echo "GUI v2 installed successfully"
