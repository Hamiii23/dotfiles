#!/usr/bin/env bash
set -euo pipefail

THEME="$HOME/.config/rofi/search.rasi"
DATA_DIR="$HOME/.local/share/helium-search"
HISTORY_FILE="$DATA_DIR/history"
BOOKMARKS_FILE="$DATA_DIR/bookmarks"
HISTORY_MAX=200
STAR="★ "

mkdir -p "$DATA_DIR"
touch "$HISTORY_FILE" "$BOOKMARKS_FILE"

add_history() {
    local entry="$1"
    [[ -z "$entry" ]] && return
    local tmp
    tmp=$(mktemp)
    {
        printf '%s\n' "$entry"
        grep -Fxv -- "$entry" "$HISTORY_FILE" 2>/dev/null || true
    } >"$tmp"
    head -n "$HISTORY_MAX" "$tmp" >"$HISTORY_FILE"
    rm -f "$tmp"
}

toggle_bookmark() {
    local entry="$1"
    [[ -z "$entry" ]] && return
    if grep -Fxq -- "$entry" "$BOOKMARKS_FILE" 2>/dev/null; then
        grep -Fxv -- "$entry" "$BOOKMARKS_FILE" >"$BOOKMARKS_FILE.tmp" || true
        mv "$BOOKMARKS_FILE.tmp" "$BOOKMARKS_FILE"
    else
        printf '%s\n' "$entry" >>"$BOOKMARKS_FILE"
    fi
}

build_list() {
    local bookmarks history
    bookmarks=""
    history=""
    if [[ -s "$BOOKMARKS_FILE" ]]; then
        bookmarks=$(sed "s/^/${STAR}/" "$BOOKMARKS_FILE")
    fi
    if [[ -s "$HISTORY_FILE" ]]; then
        history=$(grep -Fxvf "$BOOKMARKS_FILE" "$HISTORY_FILE" 2>/dev/null || cat "$HISTORY_FILE")
    fi
    printf '%s\n%s\n' "$bookmarks" "$history" | sed '/^$/d'
}

while true; do
    set +e
    input=$(build_list | rofi -dmenu \
        -p "Search" \
        -theme "$THEME" \
        -kb-custom-1 "Alt+Return" \
        -kb-custom-2 "Alt+s" \
        -mesg "<span size='small'>Enter → normal tab &#160;&#160;·&#160;&#160; Alt+Enter → private tab &#160;&#160;·&#160;&#160; Alt+s → bookmark</span>")
    exit_code=$?
    set -e

    if [[ "${HELIUM_SEARCH_DEBUG:-0}" == "1" ]]; then
        echo "$(date '+%F %T') input='$input' exit_code=$exit_code" >>"$HOME/.cache/helium-search-debug.log"
    fi

    input="$(echo -n "$input" | sed 's/^ *//;s/ *$//')"
    # strip the bookmark marker if a starred row was selected
    input="${input#"$STAR"}"

    case "$exit_code" in
    11)
        toggle_bookmark "$input"
        ;;
    *)
        break
        ;;
    esac
done

[[ -z "$input" ]] && exit 0

mode="normal"
case "$exit_code" in
0) mode="normal" ;;
10) mode="private" ;;
*) exit 0 ;; # Escape etc: do nothing
esac

if [[ "$input" =~ ^[a-zA-Z][a-zA-Z0-9+.-]*:// ]]; then
    url="$input"
elif [[ "$input" =~ ^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(:[0-9]+)?(/.*)?$ && "$input" != *" "* ]]; then
    url="https://$input"
else
    encoded=$(python3 -c "import sys,urllib.parse;print(urllib.parse.quote(sys.argv[1]))" "$input")
    url="https://unduck.link?q=$encoded"
fi

if [[ "$mode" == "normal" ]]; then
    add_history "$input"
fi

if [[ "$mode" == "private" ]]; then
    nohup helium-browser --incognito "$url" >/dev/null 2>&1 &
else
    nohup helium-browser "$url" >/dev/null 2>&1 &
fi
disown
