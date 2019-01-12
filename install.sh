#!/bin/bash
wd=$(dirname "$0")
cp $(ls -ap "$wd" | grep -v / | grep ^\\.) "$HOME"
