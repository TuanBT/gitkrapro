# GitKraPro

GitKraPro patcher for non-commercial use. Supports GitKraken v8.2.0 – 11.x.

## Requirements

- [Node.js](https://nodejs.org/) >= 18 LTS
- [Yarn](https://yarnpkg.com/) (`npm install --global yarn`)
- [GitKraken](https://www.gitkraken.com/git-client/try-free) v8.2.0 – 11.x

## Setup

```bash
git clone <repo-url>
cd <repo-dir>
yarn install
yarn build
```

## Usage

### macOS (one-click)

Double-click **`crack.command`**.

This script automatically:
1. Kills GitKraken if running
2. Removes macOS quarantine attribute
3. Patches the app
4. Re-signs with ad-hoc signature (bypasses Gatekeeper)

After GitKraken auto-updates, just run this script again — no manual steps needed.

### Windows

Double-click **`crack.bat`**.

This script automatically:
1. Kills GitKraken if running
2. Patches the app

### Manual (all platforms)

```bash
yarn gitkrapro patcher
```

## Patcher Options

```bash
# Patch with specific feature
yarn gitkrapro patcher -f pro

# Use a specific app.asar path
yarn gitkrapro patcher -a /path/to/app.asar

# Run specific actions only
yarn gitkrapro patcher backup unpack patch pack remove
```

## Other Commands

```bash
# Show info
yarn gitkrapro about

# Generate AppId
yarn gitkrapro appid generate

# Read current AppId from config
yarn gitkrapro appid read

# Read encrypted secFile
yarn gitkrapro secfile <file>
```

## Block Auto-Updates (Optional)

### Windows
Add to `C:\Windows\System32\drivers\etc\hosts`:
```
127.0.0.1 release.gitkraken.com
```
Or delete `update.exe` in `%LOCALAPPDATA%\gitkraken\`.

### macOS / Linux
Add to `/etc/hosts`:
```
127.0.0.1 release.gitkraken.com
```

## Project Structure

```
├── crack.command     # macOS one-click script
├── crack.bat         # Windows one-click script
├── bin/              # CLI entry points
├── src/              # Core source code
│   ├── patcher.ts    # Main patching logic
│   ├── appId.ts      # AppId generation/reading
│   ├── secFile.ts    # Encrypted file reader
│   ├── platform.ts   # Platform detection
│   └── logo.ts       # CLI logo
├── patches/          # Diff patch files
└── types/            # TypeScript type declarations
```
