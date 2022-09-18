# 独立性の検定(カイ二乗検定)
# ２変数間の関連性を検定可能。主に質量変数の統計で使用

# flow1: 帰無仮説と対立仮説の設定
## H0: 2つの変数は独立である
## H1: 2つの変数は連関がある

# flow2: 検定統計量の選択
## X^2 = (O1-E1)^2/E1 + (O2-E2)^2/E2 + ...
## O=観測度数、E=期待度数
## 自由度は (行の個数-1) X (列の個数-1) = df となる

# flow3: 有意水準の決定。5% 片側検定
## カイ二乗分布の特徴を図示

curve(dchisq(x, 2), 0,20) # df(自由度)2の分布
curve(dchisq(x, 1), add=TRUE)
curve(dchisq(x, 4), add=TRUE)
curve(dchisq(x, 8), add=TRUE)
# カイ二乗分布は自由度が大きるなるにつれ左右対称に近づく
curve(dchisq(x, 50), 0,100 )

# flow4: 検定統計量の実現値を求める
dataset <- read.csv("/cloud/project/csv/learn_way_data.csv")
math <- as.vector(dataset["Math"])
stats <- as.vector(dataset["Statistics"])
data_tl = table(math[["Math"]], stats[["Statistics"]], dnn="数学と統計のクロス集計")
print(data_tl)
## 期待度数の計算は行*列/合計で算出
e_11 <- 12*14/20
e_21 <- 12*6/20
e_12 <- 8*14/20
e_22 <- 8*6/20
e_value <- c(e_11,e_21,e_12,e_22) # 期待度数
f_value <- c(11, 1, 3, 5)
kai_value_p <- (f_value-e_value)^2/e_value
kai_value <- sum(kai_value_p)
kai_djuge <- qchisq(0.95, 1) #自由度1のカイ二乗分布で下側確率が0.95となるX^2の値を求める

print(kai_value)
print(kai_djuge)
# X^2 > 3.841... となったので帰無仮説は棄却される(数学と統計の趣向には連関がある)

# p値の算出
print(pchisq(kai_value, 1, lower.tail = FALSE))

# 関数を利用したカイ二乗検定
print(chisq.test(data_tl, correct = FALSE))
