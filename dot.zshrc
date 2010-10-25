
# 環境変数の設定
export LANG=ja_JP.UTF-8
export PATH=~/bin:/usr/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/share/plagger:$PATH
export MANPATH=/usr/local/man:/usr/share/man
export GISTY_DIR="$HOME/gists"
export EDITOR=vi

# 関数
find-grep () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

# エイリアスの設定
alias ls='ls -G'
alias ll='ls -ltr'
alias vi='vim'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias gi='gistpad'

# プロンプトの設定 
PROMPT='%~# '

# ヒストリの設定
HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# 履歴ファイルに時刻を記録
setopt extended_history

# 全履歴の一覧を出力する
function history-all { history -E 1 }

# 補完するかの質問は画面を超える時にのみに行う｡
LISTMAX=0

# 補完の利用設定
fpath=(~/.zsh/functions/Completion/ ${fpath})
autoload -U compinit; compinit

# sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# cdのタイミングで自動的にpushd
setopt auto_pushd 

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt append_history

# 補完候補が複数ある時に、一覧表示
setopt auto_list

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
setopt auto_menu

# カッコの対応などを自動的に補完
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# ビープ音を鳴らさないようにする
setopt NO_beep

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# 重複したヒストリは追加しない
setopt hist_ignore_all_dups

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示しない
setopt NO_list_types

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 8 ビット目を通すようになり、日本語のファイル名を表示可能
setopt print_eight_bit

# シェルのプロセスごとに履歴を共有
setopt share_history

# Ctrl+wで､直前の/までを削除する｡
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ディレクトリを水色にする｡
export LS_COLORS='di=01;36'

# ファイルリスト補完でもlsと同様に色をつける｡
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# cd をしたときにlsを実行する
function chpwd() { ls }

# ディレクトリ名だけで､ディレクトリの移動をする｡
setopt auto_cd

# C-s, C-qを無効にする。
setopt NO_flow_control

# キーバインドの設定
bindkey -e

# for screen status
if [ "$TERM" = "screen" ]; then
    chpwd () { echo -n "\e_`dirs`\e\\" }
    preexec() {
        # see [zsh-workers:13180]
        # http://www.zsh.org/mla/workers/2000/msg03993.html
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        case $cmd[1] in
            fg)
                if (( $#cmd == 1 )); then
                        cmd=(builtin jobs -l %+)
                else
                        cmd=(builtin jobs -l $cmd[2])
                fi
                ;;
            %*) 
                cmd=(builtin jobs -l $cmd[1])
                ;;
            cd|vim)
                if (( $#cmd == 2)); then
                        cmd[1]=$cmd[2]
                fi
                ;&
            *)
                echo -n "\ek$cmd[1]:t\e\\"
                return
                ;;
        esac

        local -A jt; jt=(${(kv)jobtexts})

        $cmd >>(read num rest
            cmd=(${(z)${(e):-\$jt$num}})
            echo -n "\ek$cmd[1]:t\e\\") 2>/dev/null
    }
    chpwd
fi

ssh-add

if [ "$TERM" != "screen" ]; then
    if [ `screen -ls | grep main | wc -l` = 0 ]; then
        screen -S main
    else
        screen -x main
    fi
fi
