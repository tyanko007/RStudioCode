# 相関係数の検定 (相関があるor相関がない を決定する検定)
# t = r*sqrt(n-2)/sqrt(1-r^2)
## r = 標本相関係数

# 例題:「指導法データ」について、「統計テスト1」の得点と「統計テスト2」の得点の相関係数の検定を行なってください
## 有意水準は5%の両側検定とする

dataset <- read.csv("/cloud/project/csv/learn_way_data.csv")
stats_1 <- dataset["Stats_test.1"][,1]
stats_2 <- dataset["Stats_test.2"][,1]

# flow1: キム仮説と対立仮説の設定
## H0: p=0 (母相関は0である)
## H1: p!=0 (母相関は0ではない)

# flow2: 検定統計量の設定 -> ２行目

# flow3: 有意水準aの決定 -> 5%

# flow4: 検定統計量の実現値を求める
var_count <- length(stats_1)
stats_1_sd <- sqrt(sum((stats_1 - mean(stats_1))**2)/var_count)
stats_2_sd  <- sqrt(sum((stats_2 - mean(stats_2))**2)/var_count)
stats_sum <- sum((stats_1 - mean(stats_1))*(stats_2 - mean(stats_2)))/var_count
stats_soukan <- stats_sum / (stats_1_sd*stats_2_sd)
# tips: 相関係数の計算は母標本偏差を利用する
t_1 <- stats_soukan * sqrt(var_count-2)
t_2 <- sqrt(1 - stats_soukan**2)
t_value = t_1/t_2
print(t_value)

# flow5: 帰無仮説の棄却or採択の決定
print(qt(0.025,18))
print(qt(0.025, 18, lower.tail=FALSE))
curve(dt(x, 18), -4, 4)
abline(v=qt(0.025, 18))
abline(v=qt(0.975, 18))

# 4.805~ > 2.100~ なので帰無仮説は棄却される(統計テスト[12]には相関がある)

# tips: 関数を利用した相関係数検定
print(cor.test(stats_1, stats_2))