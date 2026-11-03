#!/bin/bash
cd "$(dirname "$0")"
echo "Starting your website..."
echo "On this computer : http://localhost:8000"
IP=$( (ipconfig getifaddr en0 2>/dev/null) || (hostname -I 2>/dev/null | awk '{print $1}') )
[ -n "$IP" ] && echo "Same Wi-Fi users : http://$IP:8000"
echo "Keep this window open. Press Ctrl+C to stop."
(sleep 1; (open http://localhost:8000 2>/dev/null || xdg-open http://localhost:8000 2>/dev/null)) &
python3 -m http.server 8000
