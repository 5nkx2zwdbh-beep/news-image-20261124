#!/bin/bash
# Render front-page.html to entry.png (1024x1024) with the local
# chrome-headless-shell. No network needed: all fonts are local
# (Noto Serif Display / Noto Serif / Noto Sans).
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
"$HOME/workspace/video-projects/chrome-headless-shell-linux64/chrome-headless-shell" \
  --headless --disable-gpu --no-sandbox --hide-scrollbars \
  --window-size=1024,1024 \
  --screenshot="$HERE/entry.png" \
  "file://$HERE/front-page.html"
python3 -c "from PIL import Image; im=Image.open('$HERE/entry.png'); print('entry.png:', im.size, im.mode)"
sha256sum "$HERE/entry.png"
