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

割と使う関数備忘録
> runif(n, min, max) # min~maxまでの乱数をn個生成
> ceiling(a) # aの小数点を切り上げ
> dnorm(x, mean=a, sd=b) # N(a, b^2)を用いた確率密度
> rnorm(x, mean=a, sd=b) # N(a, b^2)を用いたn個のランダムサンプリング
> variance = ifelse(case, true, false) # 条件分岐を１行で表現
