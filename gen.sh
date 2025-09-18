#!/usr/bin/env bash
set -euo pipefail

# --- Auto-load .env if present ---
if [[ -f .env ]]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

# --- Config (from .env or defaults) ---
MOD_NAME="${MOD_NAME:-The Great War}"
MOD_VERSION="${MOD_VERSION:-0.4}"
COREPACKAGE="${COREPACKAGE:-False}"
GAME_VERSION="${GAME_VERSION:-1.9.8.0}"
OUTPUT="${OUTPUT:-filelist.xml}"

# --- Helpers ---
xml_escape() {
  # escape &, ", <, >, '
  local s="$1"
  s="${s//&/&amp;}"
  s="${s//\"/&quot;}"
  s="${s//</&lt;}"
  s="${s//>/&gt;}"
  s="${s//\'/&apos;}"
  printf '%s' "$s"
}

# Decide the XML tag based on the path (lowercased for matching)
tag_for_path() {
  local p lc
  p="$1"
  lc="$(printf '%s' "$p" | tr '[:upper:]' '[:lower:]')"

  case "$lc" in
    # text translations
    */texts/*|*/text/*|*"/texts.xml"|*"/text.xml") echo "Text" && return ;;
    # items
    */items/*|*"/items.xml")                        echo "Item" && return ;;
    # characters
    */character/*|*/characters/*|*"/character.xml"|*"/characters.xml")
                                                    echo "Character" && return ;;
    # particles
    */particles/*|*"/particles.xml")                echo "Particles" && return ;;
    # sounds
    */sounds/*|*"/sounds.xml")                      echo "Sounds" && return ;;
    # UI styles
    */ui/*style*.xml|*/uistyle/*|*"/uistyle.xml"|*/ui/*"style.xml")
                                                    echo "UIStyle" && return ;;
    # jobs
    */jobs/*|*"/jobs.xml")                          echo "Jobs" && return ;;
    # afflictions
    */afflictions/*|*"/afflictions.xml")            echo "Afflictions" && return ;;
    # factions
    */factions/*|*"/factions.xml")                  echo "Factions" && return ;;
    # item assemblies
    */itemassembly/*|*/assemblies/*|*"/itemassembly.xml")
                                                    echo "ItemAssembly" && return ;;
    # submarines (.sub) default to Submarine tag
    *.sub)                                          echo "Submarine" && return ;;
  esac

  # Fallback
  echo "Item"
}

# --- Main ---
tmp="$(mktemp)"
tmp_sorted="$(mktemp)"
trap 'rm -f "$tmp" "$tmp_sorted"' EXIT

# Collect XML and SUB files (exclude the output we’re generating)
find . -type f \( -name '*.xml' -o -name '*.sub' \) ! -path "./$OUTPUT" -print0 |
while IFS= read -r -d '' f; do
  rel="${f#./}"
  tag="$(tag_for_path "$rel")"
  path="%ModDir%/$(xml_escape "$rel")"
  # 3 fields: tag|rel|final-xml-line
  printf '%s|%s|  <%s file="%s" />\n' "$tag" "$rel" "$tag" "$path"
done > "$tmp"

# Sort by tag then by path, then keep only the final XML line (field 3)
# Using cut for portability (avoids sed regex differences)
sort -t'|' -k1,1 -k2,2 "$tmp" | cut -d'|' -f3- > "$tmp_sorted"

# Write final XML
{
  printf '<?xml version="1.0" encoding="utf-8"?>\n'
  printf '<contentpackage name="%s" modversion="%s" corepackage="%s" gameversion="%s">\n' \
    "$(xml_escape "$MOD_NAME")" \
    "$(xml_escape "$MOD_VERSION")" \
    "$(xml_escape "$COREPACKAGE")" \
    "$(xml_escape "$GAME_VERSION")" \

  cat "$tmp_sorted"

  printf '</contentpackage>\n'
} > "$OUTPUT"

echo "Wrote $OUTPUT"
