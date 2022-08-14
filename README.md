# RStudioCode
Rの学習用リポジトリ

R開発環境：RStudio Cloud
github環境と連携。commitには設定変更が必要

Terminalで実行
- git config --global user.email "you@example.com"
- git config --global user.name “Your Name”

パッケージのインストールはツールバーのToolsで可能
コマンドでも実行可能かも(install.packages("パッケージ名"))

追加でインストールしたパッケージ
- sem
- Rcmdr

csvファイルのデータを描画する場合は数値データをベクトルへ変換する必要がある
- x = read.csv("csv_file")
- x[,1] #このように記述することで数値型の配列へ変換可能

割と使う関数備忘録
- runif(n, min, max) # min~maxまでの乱数をn個生成
- ceiling(a) # aの小数点を切り上げ
- dnorm(x, mean=a, sd=b) # N(a, b^2)を用いた確率密度
- rnorm(x, mean=a, sd=b) # N(a, b^2)を用いたn個のランダムサンプリング
- variance = ifelse(case, true, false) # 条件分岐を１行で表現
- hist(x, breaks=seq(left, right, bin)) # breaksを利用するとヒストグラムの幅とデータ幅の設定が可能
- qt(x, df) # 自由度dfとしたx(確率)のt値を算出
- dt(x, df) # 自由度dfとしたt値の確率密度関数を返す
- curve(x, from, to, add=TRUE) # x(関数)に関する線グラフの作図, addをTRUEとすると既存のグラフに追記する
- abline(v) # v(x軸の値)に対しての直線の記載
- plot(a,b,xlim,ylim) # a,bに対する散布図の作成。[xy]limを設定することで軸の最大値を設定できる
- points(x,y.cex) # (x,y)の座標に散布図のプロット。cexで倍率を設定可能
- legend(x, y, legend) # (x,y)の座標に凡例を追記。pchを設定することでシンボルも設定可能
