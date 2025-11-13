# ============================================================
# mise 用 fish alias セット（追加オプション重視・パイプ禁止）
# ============================================================
~/.local/bin/mise activate fish | source

# --- ls 系（eza）
if type -q eza
    # *ユーザーが追加オプションを書けるように alias の後ろ何もつけない*
    alias ls="eza -h --icons --group-directories-first"
    alias la="eza -ha --icons --group-directories-first"
    alias ll="eza -lha --icons --group-directories-first"

    # tree 互換
    alias tree="eza --tree -h --icons --group-directories-first"
end

# --- grep → ripgrep
if type -q rg
    alias grep="rg"
end

# --- find → fd
if type -q fd
    alias find="fd"
end

# --- df, du, free（-h だけ固定）
if type -q df
    alias df="df -h"
end

if type -q du
    alias du="du -h"
end

if type -q free
    alias free="free -h"
end

