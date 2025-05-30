if status is-interactive
end

function ssh-github
    ssh-add ~/.ssh/id_ed25519
end

set -g theme_display_rw no
set -g theme_display_time yes
set -gx fish_prompt_pwd_dir_length 0
set -g theme_display_group no
set -g theme_prompt_char_normal '>'
set -g theme_display_time_format '+%H:%M'
set -gx EDITOR nano
set -gx NVM_DIR $HOME/.nvm

set GOPATH ~/go
set PATH $GOPATH/bin $PATH

function fish_greeting
    if status --is-interactive
        if test "$TERM" = xterm-kitty
            krabby random 1-5 --no-gmax --no-regional
        end
    end
end

function doge
    curl -s 'https://api.coingecko.com/api/v3/simple/price?ids=dogecoin&vs_currencies=USD' | jq -r '.dogecoin.usd'
end

function cz
    set cache_dir ~/.cache/cz
    mkdir -p $cache_dir
    set bin_name (basename (string replace -r '\.c$' '' $argv[1]))
    set bin_path $cache_dir/$bin_name

    gcc $argv[1] -o $bin_path
    and $bin_path $argv[2..-1]
end
