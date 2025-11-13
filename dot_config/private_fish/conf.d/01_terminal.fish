if status is-interactive
	# Starship起動
	if type -q starship
        starship init fish | source
    end

	if not set -q ZELLIJ
	    # テーマ一覧（1行1テーマ）
        set themes \
        	ansi ao atelier-sulphurpool ayu_mirage ayu_dark \
            catppuccin-frappe catppuccin-macchiato cyber-noir \
        	blade-runner retro-wave dracula everforest-dark \
            gruvbox-dark iceberg-dark kanagawa lucario menace \
            molokai-dark night-owl nightfox nord one-half-dark \
            onedark solarized-dark tokyo-night-dark \
            tokyo-night-storm tokyo-night vesper

        # 使うホストID
        set host_id (hostname)

        # --- Linux 標準のハッシュ関数 ---
        # sha256sum → 16進文字列 → 先頭8桁を整数に変換
        set hash (echo -n $host_id | sha256sum | cut -c 1-8)
        
		# 16進 → 10進（printf は POSIX の標準機能）
        set num (printf "%d" 0x$hash)
        
		set count (count $themes)

        set idx (math "$num % $count")

        set selected_theme $themes[$idx]

        exec zellij options --theme $selected_theme
    end
end
