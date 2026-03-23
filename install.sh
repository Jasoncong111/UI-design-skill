#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="ui-design-skill.skill"
SKILL_URL="https://raw.githubusercontent.com/Jasoncong111/UI-design-skill/main/dist/ui-design-skill.skill"

DEST_DIR="${SKILL_DIR:-}"
DEST_SOURCE=""
FORCE=0
DRY_RUN=0

print_help() {
  cat <<'EOF'
Install UI Design Skill.

Usage:
  bash install.sh [--dest PATH] [--force] [--dry-run] [--help]

Options:
  --dest PATH   Install to a specific skills directory.
  --force       Overwrite an existing ui-design-skill.skill.
  --dry-run     Print what would happen without downloading or copying.
  --help        Show this help message.

Detection order:
  1. --dest PATH
  2. SKILL_DIR environment variable
  3. $CODEX_HOME/skills
  4. $OPENCLAW_HOME/skills
  5. ~/.openclaw/skills
  6. ~/.config/openclaw/skills

Examples:
  bash install.sh
  bash install.sh --dest ~/.codex/skills
  SKILL_DIR=~/.openclaw/skills bash install.sh
EOF
}

log() {
  printf '%s\n' "$*"
}

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

require_value() {
  local flag="$1"
  local value="${2:-}"

  [[ -n "$value" ]] || die "$flag requires a value"
}

parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --dest)
        require_value "$1" "${2:-}"
        DEST_DIR="$2"
        DEST_SOURCE="--dest"
        shift 2
        ;;
      --force)
        FORCE=1
        shift
        ;;
      --dry-run)
        DRY_RUN=1
        shift
        ;;
      --help)
        print_help
        exit 0
        ;;
      *)
        die "unknown argument: $1"
        ;;
    esac
  done
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

resolve_dest_dir() {
  if [[ -n "$DEST_DIR" ]]; then
    if [[ -z "$DEST_SOURCE" ]]; then
      DEST_SOURCE="SKILL_DIR"
    fi
    return 0
  fi

  if [[ -n "${CODEX_HOME:-}" ]]; then
    DEST_DIR="${CODEX_HOME%/}/skills"
    DEST_SOURCE='CODEX_HOME'
    return 0
  fi

  if [[ -n "${OPENCLAW_HOME:-}" ]]; then
    DEST_DIR="${OPENCLAW_HOME%/}/skills"
    DEST_SOURCE='OPENCLAW_HOME'
    return 0
  fi

  if [[ -d "$HOME/.openclaw/skills" ]]; then
    DEST_DIR="$HOME/.openclaw/skills"
    DEST_SOURCE='~/.openclaw/skills'
    return 0
  fi

  if [[ -d "$HOME/.config/openclaw/skills" ]]; then
    DEST_DIR="$HOME/.config/openclaw/skills"
    DEST_SOURCE='~/.config/openclaw/skills'
    return 0
  fi

  return 1
}

download_skill() {
  local target_path="$1"

  if command_exists curl; then
    curl -fsSL "$SKILL_URL" -o "$target_path"
    return 0
  fi

  if command_exists wget; then
    wget -qO "$target_path" "$SKILL_URL"
    return 0
  fi

  die "curl or wget is required to download $SKILL_NAME"
}

main() {
  parse_args "$@"

  resolve_dest_dir || die "could not determine a skills directory automatically. Use --dest PATH or set SKILL_DIR."

  local resolved_dest="$DEST_DIR"
  local target_path="${resolved_dest%/}/$SKILL_NAME"

  if [[ -e "$target_path" && "$FORCE" -ne 1 ]]; then
    die "$target_path already exists. Re-run with --force to overwrite."
  fi

  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "Dry run: would install $SKILL_NAME to $target_path"
    log "Resolved via: $DEST_SOURCE"
    exit 0
  fi

  mkdir -p "$resolved_dest"

  local tmp_file
  tmp_file="$(mktemp)"
  trap 'rm -f "$tmp_file"' EXIT

  download_skill "$tmp_file"

  [[ -s "$tmp_file" ]] || die "downloaded file is empty"

  cp "$tmp_file" "$target_path"

  log "Installed $SKILL_NAME"
  log "Path: $target_path"
  log "Resolved via: $DEST_SOURCE"

  if [[ "$DEST_SOURCE" != "CODEX_HOME" ]]; then
    log "If your CLI uses a different skills directory, re-run with --dest PATH."
  fi
}

main "$@"
