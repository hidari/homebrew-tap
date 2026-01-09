# Hidari's Homebrew Tap

This is a [Homebrew](https://brew.sh) tap for my tools.

## Usage

```bash
brew install hidari/tap/love
brew install hidari/tap/rip
```

## Available Tools
- love
    - A lovely terminal heart animation (pronounced as "trouble") 💜. For more details, see [ToLOVE-ru](https://github.com/hidari/tolove-ru).
- rip
    - Handling cross-platform ZIP archives that just work everywhere. For more details, see [rip-zip](https://github.com/hidari/rip-zip).

## Automatic Formula Updates

This repository supports automatic Formula updates when you publish a new release in your tool repository.

### Setup

1. **Create a Personal Access Token (PAT)**
   - Go to GitHub Settings > Developer settings > Personal access tokens
   - Create a token with `repo` scope
   - Copy the token

2. **Add the token to your tool repository**
   - Go to your tool repository (e.g., `rip-zip`)
   - Settings > Secrets and variables > Actions
   - Add a new secret named `HOMEBREW_TAP_TOKEN` with the PAT

3. **Add the workflow to your tool repository**
   - Copy `examples/update-homebrew-formula.yml` to `.github/workflows/` in your tool repository
   - Update `YOUR_FORMULA_NAME` to match your formula (e.g., `rip` or `love`)

4. **Register your formula in `scripts/update-formula.sh`**
   - Add your formula's URL patterns to the `get_urls` function

### How it works

```
Tool Repository (e.g., rip-zip)          homebrew-tap
         |                                    |
         | 1. Publish release                 |
         v                                    |
   [GitHub Actions]                           |
         |                                    |
         | 2. repository_dispatch             |
         +------------------------------------>
                                              |
                                        [GitHub Actions]
                                              |
                                              | 3. Download binaries
                                              | 4. Calculate checksums
                                              | 5. Update Formula
                                              | 6. Create PR
                                              v
                                        [Pull Request]
```
