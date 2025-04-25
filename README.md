# CodeQL Monorepo Scanner

Fast, parallel CodeQL scanning for monorepos, targeting only modified projects for efficiency.

## Overview

Scans a monorepo by analyzing changed top-level project folders with CodeQL, skipping unmodified ones to optimize speed. Supports varied languages and build requirements.

### Example
Changes in:
- `/project-python/app.py`
- `/project-java/src/main/java/com/example/App.java`

Only `project-python` and `project-java` are scanned for PRs or merges to `main`.

## Features
- **Parallel Jobs**: Scans modified project folders concurrently.
- **Language Flexibility**:
  - **Compiled** (e.g., Java, C#): Needs build script at `.github/build/{project}.sh`.
  - **Non-Compiled** (e.g., Python, JS): No build required.
  - One compiled language per project folder.
- **Selective Scans**:
  - PRs/merges: Scans only changed project folders.
  - Skips specified directories via GitHub Actions `paths-ignore`.
- **Full Scan Options**:
  - Manual trigger for all folders.
  - Scheduled full scans.
  
## Setup
1. Place build scripts for compiled languages in `.github/build/{project}.sh`.
2. Configure GitHub Actions to:
   - Identify changed projects.
   - Run parallel CodeQL scans.
   - Skip directories in `paths-ignore`.
3. Enable manual and scheduled full scans.

## Optional Enhancements
- Support per-language build scripts.
- Cache dependencies for faster scans.