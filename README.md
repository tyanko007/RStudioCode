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

文字列の場合は以下のような形式となる
- object[obj[array]] 実際のデータはobjの配列内に格納される
- ${var}[["row_name"]] 変数に格納した場合左記のように記載すると個々のデータにアクセス可能


割と使う関数備忘録
- runif(n, min, max) # min~maxまでの乱数をn個生成
- ceiling(a) # aの小数点を切り上げ
- dnorm(x, mean=a, sd=b) # N(a, b^2)を用いた確率密度
- rnorm(x, mean=a, sd=b) # N(a, b^2)を用いたn個のランダムサンプリング
- variance = ifelse(case, true, false) # 条件分岐を１行で表現
- hist(x, breaks=seq(left, right, bin)) # breaksを利用するとヒストグラムの幅とデータ幅の設定が可能
- qt(x, df) # 自由度dfとしたx(確率)のt値を算出
- dt(x, df) # 自由度dfとしたt値の確率密度関数を返す
- curve(x, from, to, add=TRUE, col="color") # x(関数)に関する線グラフの作図, addをTRUEとすると既存のグラフに追記する
- abline(v, col="color") # v(x軸の値)に対しての直線の記載
- plot(a,b,xlim,ylim) # a,bに対する散布図の作成。[xy]limを設定することで軸の最大値を設定できる
- points(x,y.cex) # (x,y)の座標に散布図のプロット。cexで倍率を設定可能
- legend(x, y, legend) # (x,y)の座標に凡例を追記。pchを設定することでシンボルも設定可能
- (as.)matrix(x, nrow=1, ncol=1, option{byrow=bool}) # xを２次元配列のマトリックスデータとして出力。byrowを指定することで行を優先した値の設定が可能
- (as.)array(matrix, type) # 多次元配列のデータを一次元配列に変換
- table(a,b, row.names="table_name") # a,bにおけるクロス集計を実施
- qnorm(p, {lower.tail=${bool}}) # 標準正規分布における下側確立に対応する値を算出
- pnorm(p, {lower.tail=${bool}}) # 標準正規分布における下側確立の算出
- qt(p, df, {lower.tail=${bool}}) # t分布における下側確率に対応する値を算出
- pt(p, df, {lower.tail=${bool}}) # t分布における下側確立の算出
- qchisq(p, df, {lower.tail=${bool}}) # カイ二乗分布における下側確率に対応する値の算出
- pchisq(p, df, {lower.tail=${bool}}) # カイ二乗分布における下側確立の算出
- t.test(x, val={x2...}, option{mu=x', sd=σ^n, var.equal=bool, paired=bool}) # xにおけるt検定の実施
- cor.test(a,b) # a,bの無相関検定の実施
- chisq.test(table) # tableにおける独立性の検定の実施
- dt(x, df) # t分布の確立(密度)の算出
- data.frame(x, label) # データフレームの作成
- var.test(a,b) # a,b間での分散の等質性の検定(2変数の分散検定)
- rep(x, count) # xをcount数分繰り返した配列データの作成
- cbind(str_array, [str_array2, ...]) # データを行列に変換
- colMeans(vector) # 各行の平均値を計算
- df(x, df1, df2) # 自由度1と自由度2に対するF分布の確率密度を算出
- factor(str.array) # 文字列配列を要因型へ変換
- oneway.test(data~vector, option{var.equal=bool}) # 一元配置分散分析のみ実施可能な分散分析用関数
- aov(data~vector) # 最も一般的な分散分析用関数。結果はsummary関数を利用すれば分散分析表で実装可能
- anova(lm(data~vector)) # 複数のモデルの比較など高度な分析にも対応している分散分析関数
- qtukey(x, df1, df2, option{lower.tail=bool}) # 自由度に沿ったtukeyの棄却値を算出
- TukeyHSD(aov(data~vector)) # 多重比較の算出関数
