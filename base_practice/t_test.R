# t分布を用いた検定(1つの平均値の検定・母分散σ^2が未知)
## 母分散の分散値が不明な場合、検定統計量の計算ができない
## そのため不偏分散から割り出されるσを代用して計算をする手法
## t分布は自由度=n-1に従う

sample_dataset <- read.csv("/cloud/project/csv/learn_way_data.csv")
psychology <- sample_dataset["Heart"][,1]

# 自由度が影響するグラフの変化
curve(dt(x,8), -5,5)
curve(dt(x,4), add = TRUE)
curve(dt(x,2), add = TRUE)
curve(dt(x,1), add = TRUE)

# 仮説の設定と有意水準は既知の場合と一緒
# 検定統計量の実現値の計算
t_1 <- mean(psychology) - 12 # t分子
t_2 <- sqrt(var(psychology)/length(psychology)) # t分母 
t <- t_1/t_2 # 統計検定量
print(t)

# 帰無仮説の棄却or採択の決定
p_under = qt(0.025, length(psychology)-1)
p_upper = qt(0.975, length(psychology)-1)
print(p_under)
print(p_upper)

# pt関数を利用したp値の計算も可能
p_value = 2*pt(abs(t), length(psychology)-1, lower.tail = FALSE)
print(p_value)
print(ifelse(0.05>p_value, TRUE, FALSE))

# t_test関数を利用したt検定
print(t.test(psychology, mu=12))