# SoilSense AI — Mobile & Web Soil Disease & Crop Advisor

A full-stack mobile-first application for soil image analysis, crop recommendations, fertilizer guidance, and an AI agricultural assistant.

## Mobile Features
- **Direct Phone Camera Capture**: Uses `capture="environment"` to open your phone's rear camera directly in the field.
- **Progressive Web App (PWA)**: Installable standalone app mode ("Add to Home Screen") on iOS and Android.
- **Local Network Wi-Fi Access**: Open `http://<LAN_IP>:5173` on any mobile phone on the same Wi-Fi network.
- **Integrated QR Code**: Scan the QR code directly from the screen with your phone camera to launch the app instantly.
- **Mobile Bottom Navigation**: Ergonomic thumb tabs for **Scan**, **Field Report**, and **AI Advisor**.
- **Capacitor Native Setup**: Pre-configured with `@capacitor/core` and `@capacitor/cli` for iOS and Android native packaging.

---

## Quick Start (Mobile & Web)

Run the unified mobile launcher from the project root:

```bash
./start-mobile.sh
```

Or run via npm:

```bash
npm run mobile
```

This automatically:
1. Detects your local Wi-Fi IP address.
2. Starts the backend on port `5001`.
3. Starts the frontend on port `5173` exposed to your network (`--host 0.0.0.0`).
4. Prints the mobile URL (`http://<LAN_IP>:5173`) and connects the camera.

---

## Opening on your Physical Phone

1. Make sure your phone is connected to the same Wi-Fi network as your computer.
2. Open your phone camera or browser and navigate to:
   ```
   http://<YOUR_LOCAL_IP>:5173
   ```
   *(Or click "Connect Phone" in the top bar to scan the QR code).*
3. **Install as App**:
   - **iPhone (Safari)**: Tap the **Share** button → tap **Add to Home Screen**.
   - **Android (Chrome)**: Tap the **Three Dots** menu → tap **Install app** or **Add to Home screen**.

---

## Native Mobile Build with Capacitor (Optional)

If you have Xcode or Android Studio installed and want to build native `.apk` or `.ipa` binaries:

```bash
cd frontend
npm run build
npx cap add ios      # Creates iOS Xcode project
npx cap add android  # Creates Android Studio project
npx cap sync
npx cap open ios     # Opens in Xcode
npx cap open android # Opens in Android Studio
```

---

## Architecture & Ports
- **Frontend**: Vite 5 + React 18 (`http://localhost:5173` & `http://0.0.0.0:5173`)
- **Backend API**: Node.js + Express + Multer (`http://0.0.0.0:5001`)
- **Proxy**: Vite automatically proxies `/api/*` to the backend on port `5001`.
