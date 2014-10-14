#! /usr/bin/env bash

set -e

# Update xctool
brew update
brew upgrade xctool
echo -n "xctool version: "
xctool --version
