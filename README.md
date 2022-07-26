# RStudioCode
Rの学習用リポジトリ

R開発環境：RStudio Cloud
github環境と連携。commitには設定変更が必要

Terminalで実行
> git config --global user.email "you@example.com"
> git config --global user.name “Your Name”

パッケージのインストールはツールバーのToolsで可能
コマンドでも実行可能かも(install.packages("パッケージ名"))

追加でインストールしたパッケージ
> sem
> Rcmdr

csvファイルのデータを描画する場合は数値データをベクトルへ変換する必要がある
> x = read.csv("csv_file")
> x[,1] #このように記述することで数値型の配列へ変換可能

