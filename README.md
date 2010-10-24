自分用作業環境用レポジトリ
============================

方針
----

 * $SHELL は bash でもし可能なら zsh を起動する
 * 設定ファイルとか変更したときにコミットするのめんどくさいので rake やシェルスクリプトで色々自動化する
 * その他にもよくやる作業を rake で自動化する

初期化
------

    mkdir -p ~/dev
    git clone git@github.com:tily/environment.git ~/dev/environment
    rake -f ~/dev/environment/Rakefile env_install

クリーンアップ
--------------

    rake -f ~/Rakefile clean

