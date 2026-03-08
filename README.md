# Tools & Support Files

Support scripts, documentation, and utilities for the project. Not part of the production build.

## Structure

```
tools/
├── scripts/         # Build & release scripts
│   ├── release.sh       # Interactive release script (version bump, build, merge, tag)
│   ├── bundle-assets.py # Bundle CSS/JS assets from legacy project
│   ├── compile-less.py  # Compile LESS to CSS
│   ├── debug-versions.js
│   └── generate-lang-js.py
├── docs/            # Project documentation & analysis
│   ├── CONVENTION.md
│   ├── FEATURE_GAP_ANALYSIS.md
│   ├── P1_IMPLEMENTATION_PLAN.md
│   └── UI_UX_REFERENCE.md
├── testing/         # Playwright smoke tests & test plans
│   ├── playwright.config.ts  # Playwright configuration
│   ├── smoke-public.spec.ts  # 22 public page smoke tests
│   ├── smoke-dynamic.spec.ts # Dynamic page discovery tests (song, artist, etc.)
│   ├── smoke-auth.spec.ts    # Auth-required page tests (manage/*, profile/*)
│   └── pages.md              # Manual test plan notes
├── database/        # SQL scripts
│   ├── hac_mini.sql
│   └── generate_score.sql
├── requests/        # HTTP request files (REST client)
│   └── products.http
├── release.command  # macOS double-click release launcher
├── release.bat      # Windows double-click release launcher
├── build-bundles.js # Legacy JS bundle builder
├── find_test_songs.js
└── writefile.js
```

## Smoke Tests (Playwright)

Automated tests that visit every page and check for runtime errors (500, Next.js error overlays). Run before prod builds to catch regressions.

**Prerequisites:** Dev server running on `localhost:3000` with database accessible.

```bash
npm run test          # Run all smoke tests
npm run test:smoke    # Run with list reporter (verbose output)
```

**Test files:**
- `smoke-public.spec.ts` — 22 static public pages (home, about, genre, search, etc.)
- `smoke-dynamic.spec.ts` — Dynamic pages discovered from list pages (song detail, artist detail, etc.)
- `smoke-auth.spec.ts` — Auth-required pages (manage/*, profile/*) using cookie injection

**Environment variables:**
- `BASE_URL` — Override base URL (default: `http://localhost:3000`)
- `SMOKE_USER_ID` — User ID for auth tests (default: `1`)

```bash
SMOKE_USER_ID=123 npm run test:smoke   # Test with specific user
BASE_URL=https://staging.example.com npm run test:smoke  # Test against staging
```

## Release Process

Double-click `release.command` (macOS) or `release.bat` (Windows), or run:

```bash
./tools/scripts/release.sh          # Interactive (asks for version bump)
./tools/scripts/release.sh patch    # Auto patch bump (0.0.1 → 0.0.2)
./tools/scripts/release.sh minor    # Auto minor bump (0.1.0 → 0.2.0)
./tools/scripts/release.sh major    # Auto major bump (1.0.0 → 2.0.0)
```
