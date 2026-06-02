#!/bin/bash
# Validates the is_latest detection logic used in ci-main.yaml.
# Each scenario creates a temporary git repo with fake tags, runs the
# same detection logic as the CI, and checks the expected result.

set -euo pipefail

PASS=0
FAIL=0

detect_is_latest() {
  local version=$1
  local tags=$2  # space-separated existing tags (e.g. "v14.0.0 v13.5.0")

  local tmpdir
  tmpdir=$(mktemp -d)

  (
    cd "$tmpdir"
    git init -q
    git config user.email "ci-test@local"
    git config user.name "CI Test"
    git config tag.gpgSign false
    git config commit.gpgSign false
    git commit --allow-empty -q -m "init"
    for tag in $tags; do
      git tag "$tag"
    done

    CURRENT_MAJOR=$(echo "$version" | cut -d. -f1)
    HIGHEST_MAJOR=$(git tag --list 'v*' \
      | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' \
      | sed 's/^v//' \
      | cut -d. -f1 \
      | sort -n \
      | tail -1)
    HIGHEST_MAJOR=${HIGHEST_MAJOR:-0}

    if [ "$CURRENT_MAJOR" -ge "$HIGHEST_MAJOR" ]; then
      echo "true"
    else
      echo "false"
    fi
  )

  rm -rf "$tmpdir"
}

check() {
  local scenario=$1
  local version=$2
  local existing_tags=$3
  local expected=$4

  local result
  result=$(detect_is_latest "$version" "$existing_tags")

  if [ "$result" == "$expected" ]; then
    echo "✅ PASS | $scenario"
    echo "        version=v$version  existing=[${existing_tags:-none}]  is_latest=$result"
    PASS=$((PASS + 1))
  else
    echo "❌ FAIL | $scenario"
    echo "        version=v$version  existing=[${existing_tags:-none}]"
    echo "        expected=$expected  got=$result"
    FAIL=$((FAIL + 1))
  fi
  echo ""
}

echo "========================================"
echo " is_latest detection policy — unit tests"
echo "========================================"
echo ""

# --- Core scenarios ---

check "New major v15: first v15 release while v14 exists" \
  "15.0.0" "v14.0.0 v14.1.0 v13.5.0" "true"

check "Old major v14 patch: v15 already released" \
  "14.2.0" "v15.0.0 v14.0.0 v14.1.0" "false"

check "Minor update on latest major v15" \
  "15.1.0" "v15.0.0 v14.0.0" "true"

check "Very old major v13 patch: v15 and v14 both exist" \
  "13.8.0" "v15.0.0 v14.0.0 v13.7.0" "false"

check "Patch on latest major (same major)" \
  "15.0.1" "v15.0.0 v14.0.0" "true"

check "First-ever release: no existing tags" \
  "1.0.0" "" "true"

# --- Edge cases ---

check "Only one existing tag (same major)" \
  "14.1.0" "v14.0.0" "true"

check "Downgrade attempt: building older version" \
  "13.0.0" "v14.0.0" "false"

# --- Summary ---

echo "========================================"
echo " Results: $PASS passed, $FAIL failed"
echo "========================================"

if [ "$FAIL" -gt 0 ]; then
  exit 1
fi
