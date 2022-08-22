# 対応のあるt検定の実装

## 変化量の確認
dataset <- read.csv("/cloud/project/csv/learn_way_data.csv")
stats_1 <- dataset["Stats_test.1"][,1] # X1
stats_2 <- dataset["Stats_test.2"][,1] # X2

amont_of_change = stats_2 - stats_1 # 変化量D = X2-X1
print(amont_of_change)
print(mean(stats_1))
print(mean(stats_2))
print(sd(stats_1))
print(sd(stats_2))
print(sd(amont_of_change))
print(mean(amont_of_change)) # 変化量の平均D' = X2'-X1'

## 変化量Dが正規分布に従うと仮定した場合、標準平均D'もまた正規分布に従うと仮定できる
## 正規分布に従うのであればt検定が可能(対応のあるt検定)

# flow1: 帰無仮説と対立仮説の設定
## H0: U=0(得点の変化の母平均は0である)
## H1: U!=0(得点の変化の母平均は0ではない)

# flow2: 検定統計量の選択
## t = D'/(σ^d/√n) ※D-U出ないのはU=0と仮定しているため
## 自由度df=n-1に従う

# flow3: 有意水準の決定:5% 両側検定

# flow4: 実現値の算出
amont_of_change_mean <- mean(amont_of_change)
amont_of_change_sd <- sd(amont_of_change)
t_value <- amont_of_change_mean / (amont_of_change_sd/sqrt(length(amont_of_change)))
# print(t_value)
t_upper = qt(0.975, length(amont_of_change)-1)
t_lower = qt(0.025, length(amont_of_change)-1)

print(data.frame(values = c(t_value, t_upper, t_lower), row.names=c("t_value", "0.975", "0.025")))

# 関数での実装
print(t.test(amont_of_change))
## option paired=TRUE と指定した場合変化量を定義せずとも2変数間の対応のあるt検定を実装可能
