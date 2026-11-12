#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="/Users/mohanr/Downloads/moonlight_events_node/.bin/bin:/usr/local/bin:$PATH"

# Detect local Wi-Fi / LAN IP address
LAN_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "127.0.0.1")
BACKEND_PORT=5001
FRONTEND_PORT=5173

echo "========================================================"
echo " 🌱 Krishi Mithra - AI — Mobile & Web App Launcher"
echo "========================================================"
echo " 📡 Local URL:       http://localhost:${FRONTEND_PORT}"
echo " 📱 Mobile (Wi-Fi):  http://${LAN_IP}:${FRONTEND_PORT}"
echo " ⚙️  Backend API:     http://${LAN_IP}:${BACKEND_PORT}"
echo "========================================================"
echo ""
echo "📱 How to open on your phone:"
echo " 1. Ensure your phone is connected to the same Wi-Fi network."
echo " 2. Open your phone camera or browser and navigate to:"
echo "    http://${LAN_IP}:${FRONTEND_PORT}"
echo " 3. Tap 'Add to Home Screen' to install it like a native mobile app."
echo ""
echo "Starting backend and frontend services..."

# Start backend
cd "$DIR/backend"
PORT=$BACKEND_PORT node server.js &
BACKEND_PID=$!

# Trap termination signals to cleanly shut down child processes
cleanup() {
  echo ""
  echo "Shutting down SoilSense AI services..."
  kill $BACKEND_PID 2>/dev/null || true
  exit 0
}
trap cleanup SIGINT SIGTERM EXIT

# Start frontend
cd "$DIR/frontend"
npx vite --host 0.0.0.0 --port $FRONTEND_PORT

wait $BACKEND_PID
