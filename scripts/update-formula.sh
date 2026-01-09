#!/bin/bash
set -e

FORMULA=$1
VERSION=$2

# Remove 'v' prefix if present
VERSION_NUM=${VERSION#v}

FORMULA_FILE="Formula/${FORMULA}.rb"

if [ ! -f "$FORMULA_FILE" ]; then
  echo "Error: Formula file not found: $FORMULA_FILE"
  exit 1
fi

echo "Updating $FORMULA to version $VERSION_NUM..."

# Define download URLs based on formula
get_urls() {
  case $FORMULA in
    rip)
      INTEL_URL="https://github.com/hidari/rip-zip/releases/download/v${VERSION_NUM}/rip-zip-x86_64-apple-darwin.zip"
      ARM_URL="https://github.com/hidari/rip-zip/releases/download/v${VERSION_NUM}/rip-zip-aarch64-apple-darwin.zip"
      ;;
    love)
      INTEL_URL="https://github.com/hidari/tolove-ru/releases/download/v${VERSION_NUM}/love-darwin-amd64-${VERSION_NUM}.tar.gz"
      ARM_URL="https://github.com/hidari/tolove-ru/releases/download/v${VERSION_NUM}/love-darwin-arm64-${VERSION_NUM}.tar.gz"
      ;;
    *)
      echo "Error: Unknown formula: $FORMULA"
      exit 1
      ;;
  esac
}

# Get SHA256 checksum for a URL
get_sha256() {
  local url=$1
  local tmpfile=$(mktemp)

  echo "Downloading: $url"
  if ! curl -sL -o "$tmpfile" "$url"; then
    echo "Error: Failed to download $url"
    rm -f "$tmpfile"
    exit 1
  fi

  local sha=$(sha256sum "$tmpfile" | cut -d' ' -f1)
  rm -f "$tmpfile"
  echo "$sha"
}

get_urls

echo "Fetching checksums..."
INTEL_SHA=$(get_sha256 "$INTEL_URL")
echo "Intel SHA256: $INTEL_SHA"

ARM_SHA=$(get_sha256 "$ARM_URL")
echo "ARM SHA256: $ARM_SHA"

# Update version in formula
sed -i "s/version \"[^\"]*\"/version \"${VERSION_NUM}\"/" "$FORMULA_FILE"

# Update SHA256 checksums
# Find and replace the sha256 values based on architecture context
case $FORMULA in
  rip)
    # For rip: intel comes first, then arm
    sed -i "0,/sha256 \"[a-f0-9]\{64\}\"/s//sha256 \"${INTEL_SHA}\"/" "$FORMULA_FILE"
    sed -i "0,/sha256 \"${INTEL_SHA}\"/! {0,/sha256 \"[a-f0-9]\{64\}\"/s//sha256 \"${ARM_SHA}\"/}" "$FORMULA_FILE"
    ;;
  love)
    # For love: intel comes first, then arm
    sed -i "0,/sha256 \"[a-f0-9]\{64\}\"/s//sha256 \"${INTEL_SHA}\"/" "$FORMULA_FILE"
    sed -i "0,/sha256 \"${INTEL_SHA}\"/! {0,/sha256 \"[a-f0-9]\{64\}\"/s//sha256 \"${ARM_SHA}\"/}" "$FORMULA_FILE"
    ;;
esac

echo "Updated $FORMULA_FILE:"
cat "$FORMULA_FILE"

echo ""
echo "Formula updated successfully!"
