#!/bin/bash
set -e
# All-in-one GitKraken crack script: kill + xattr + patch + codesign
# Chạy 1 lần duy nhất sau mỗi lần GitKraken update, không cần thao tác tay.

APP_PATH="/Applications/GitKraken.app"

if [ ! -d "$APP_PATH" ]; then
    echo "Error: Application not found at $APP_PATH"
    exit 1
fi

# 1. Kill GitKraken if running
if pgrep -f "GitKraken" > /dev/null 2>&1; then
    echo "==> Closing GitKraken..."
    pkill -f "GitKraken" || true
    # Wait until process fully exits (max 10s)
    for i in $(seq 1 20); do
        pgrep -f "GitKraken" > /dev/null 2>&1 || break
        sleep 0.5
    done
    if pgrep -f "GitKraken" > /dev/null 2>&1; then
        echo "Warning: GitKraken is still running. Force killing..."
        pkill -9 -f "GitKraken" || true
        sleep 1
    fi
fi

# 2. Remove quarantine attribute
echo "==> Removing quarantine attribute for: $APP_PATH"
xattr -dr com.apple.quarantine "$APP_PATH" 2>/dev/null || true

# 3. Build project if needed
cd "$(dirname "$0")"
if [ ! -d "node_modules" ]; then
    echo "==> Installing dependencies..."
    yarn install
fi
if [ ! -d "dist" ]; then
    echo "==> Building project..."
    yarn build
fi

# 4. Run patcher
echo "==> Running patcher..."
if ! yarn gitkrapro patcher; then
    echo "Error: Patcher failed!"
    exit 1
fi

# 5. Re-sign with ad-hoc signature (bypass Gatekeeper after patching)
echo "==> Re-signing app with ad-hoc signature..."
codesign --force --deep --sign - "$APP_PATH" 2>/dev/null || true

# 6. Clear quarantine again after codesign
xattr -dr com.apple.quarantine "$APP_PATH" 2>/dev/null || true

echo "==> All done! You can open GitKraken now."