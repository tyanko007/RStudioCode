# 標準正規分布を用いた検定
# (1つの平均値の検定・母分散σ^2が既知)

sample_dataset = read.csv("/cloud/project/csv/learn_way_data.csv")
psychology = sample_dataset["Heart"][,1]

# print(psychology)

# flow1: 帰無仮説と対立仮説の設定
## H0 = u=12(心理学の母平均は12である)
## H1 = u!=12(心理学の母平均は12ではない)

# flow2: 検定統計量の選択
## Z=(X' - u)/(σ/sqrt(n))

# flow3: 有意水準の決定
## 5%(a = 0.05)

# flow4: 検定統計量の実現値を求める
## 前提として、母集団分布は X~N(12, 10)、平均値の標本分布はX'~N(12, 10/20)となるはず
## サンプルサイズはn=20

z_1 <- mean(psychology) - 12 # 分子
z_2 <- sqrt(10/length(psychology)) # 分母
z = z_1 / z_2 # 検定統計量
print(z)

# flow5: 帰無仮説の棄却 or 採択の決定
## 標準正規分布での両側検定の棄却域(5%)を計算

# 標準正規分布の[下側,上側]確率を求める
print(qnorm(0.025)) # 下側
print(qnorm(0.975)) # 上側
# 棄却域の作図
curve(dnorm(x), -3, 3)
abline(v=qnorm(0.025))
abline(v=qnorm(0.025, lower.tail = FALSE))

# pnormを用いた直接的なp値の計算
p_value <- 2*pnorm(2.828427, lower.tail = FALSE)
print(p_value)
print(ifelse(0.05 > p_value, TRUE, FALSE))