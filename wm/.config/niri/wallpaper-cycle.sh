#!/usr/bin/env bash
set -euo pipefail

WALL_DIR="$HOME/Pictures/wallpapers"
CACHE="$HOME/.cache/awww-last"

cycle() {
    mapfile -t imgs < <(find "$WALL_DIR" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.gif' -o -iname '*.bmp' \) 2>/dev/null | sort)
    if (( ${#imgs[@]} == 0 )); then
        return 1
    fi

    last=""
    if [[ -f "$CACHE" ]]; then
        last="$(cat "$CACHE")"
    fi

    wall="${imgs[RANDOM % ${#imgs[@]}]}"
    if (( ${#imgs[@]} > 1 )); then
        for _ in "${imgs[@]}"; do
            candidate="${imgs[RANDOM % ${#imgs[@]}]}"
            if [[ "$candidate" != "$last" ]]; then
                wall="$candidate"
                break
            fi
        done
    fi

    echo "$wall" > "$CACHE"

    for _ in {1..50}; do
        awww query >/dev/null 2>&1 && break
        sleep 0.1
    done

    awww img "$wall" --transition-type random --transition-duration 2
    matugen image "$wall" -m dark --source-color-index 0 --prefer darkness
}

if [[ "${1:-}" == "--once" ]]; then
    cycle
else
    while true; do
        cycle || true
        sleep 300
    done
fi