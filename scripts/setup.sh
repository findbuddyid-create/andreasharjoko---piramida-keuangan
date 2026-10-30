#!/usr/bin/env bash
# Pasang ulang semua tool video: Remotion, HyperFrames, FFmpeg, Whisper, yt-dlp.
set -euo pipefail
cd "$(dirname "$0")/.."

if ! command -v ffmpeg >/dev/null; then
  sudo apt-get update && sudo apt-get install -y ffmpeg
fi

npm install
pip install --break-system-packages -r requirements.txt

ffmpeg -version | head -1
npx hyperframes --version
yt-dlp --version
python3 -c "import whisper; print('whisper OK')"
