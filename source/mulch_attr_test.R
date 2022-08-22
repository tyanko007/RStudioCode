# 独立な2群のt検定
## 平均値の差の検定(差ではなく,一致するかどうかの検定)
## 検定統計量 t=X1'-X2' / ((((n1-1)σ1^2) + ((n2-1)σ2^2))/n1+n2-2 * (1/n1 + 1/n2))
### X'=実数の平均, n=サンプルサイズ, σ^2 = 不偏分散
## 標本分布は自由度=n1+n2-2に従う

stats_m <- c(6,10,6,10,5,3,5,9,3,3)
stats_h <- c(11,6,11,9,7,5,8,7,7,9)

# flow1: 帰無仮説と対立仮説の設定
## H0: 母平均に差はない、H1: 母平均に差はある

# flow2: 検定統計量の選択(文頭参照)

# flow3: 有意水準の決定：5%

# flow4: 実現値の計算
m_avg <- mean(stats_m)
h_avg <- mean(stats_h)
m_var <- var(stats_m)
h_var <- var(stats_h)

## 2要素をマージした標準偏差の算出
## (((n1-1)σ1^2) + ((n2-1)σ2^2))/n1+n2-2
marge_sd <- sqrt(((((length(stats_m)-1)*m_var)) + (((length(stats_h)-1)*h_var))) / (length(stats_m)+length(stats_h)-2))
#print(marge_sd)

t_1 <- marge_sd * sqrt(1/length(stats_m) + 1/length(stats_h)) # t分母
t_2 <- mean(stats_m)-mean(stats_h) # t分子
#print(t_1)
#print(t_2)
t_value = t_2/t_1
p_value_low = qt(0.025, length(stats_m)+length(stats_h)-2)
p_value_high = qt(0.025, length(stats_m)+length(stats_h)-2, lower.tail=FALSE)
print(data.frame(value=c(t_value, p_value_low, p_value_high), row.names=c("T値", "0.025", "0.975")))

# 関数での実装
print(t.test(stats_m, stats_h, var.equal = TRUE))
