# 一元配置分散分析(対応あり)

# サンプルデータ
names <- factor(rep(c("田中", "岸", "大引", "吉川", "萩野"), 3))
number <- c(7,8,9,5,6,5,4,7,1,3,8,6,7,2,5)
value <- factor(c(rep("sengata", 5), rep("biseki", 5), rep("plob", 5)))


# 対応のないものとして分析してみる
## H0: 3要素の平均的差はない
## H1: 3要素に平均的差はある
## 有意水準は5%
print(summary(aov(number~value)))
# 0.112 > 0.05 なので有意なし。一般的に対応ありのデータをなしとして分析を検定を実施すると有効な結果は得にくくなる
 
# 対応ありとして実施

# flow1: 帰無仮説と対立仮説の設定
## 先ほどと同じ

# flow2: 検定統計量の決定
## F = (条件平方和/条件の自由度)/(残差平方和/残差の自由度)
## 条件~ = 郡間~。対応のあるなしで呼び方が変わっているだけ

# flow3: 有意水準の決定：5% 片側

# flow4: 検定統計量の実現値の計算
print(summary(aov(number~value+names)))

f_line <- qf(0.05, 2, 8, lower.tail=FALSE)
print(data.frame(val=c(14.7, f_line), row.names=c("f_value", "0.05")))

all_data <- matrix(number, ncol=3, nrow=5) # 全データ(列:科目(3))
# print(all_data)
val_mean <- colMeans(all_data)
# print(val_mean)
pop_mean <- rowMeans(all_data)
# print(pop_mean)
all_mean <- mean(all_data)
# print(all_mean)

all_mean_table <- matrix(all_mean, nrow=5, ncol=3)
# print(all_mean_table)
val_mean_table <- matrix(rep(val_mean), nrow=5, ncol=3,byrow = TRUE)
# print(val_mean_table)
pop_mean_table <- matrix(pop_mean, nrow=5, ncol=3)
# print(pop_mean_table)

all_set <- all_data - all_mean_table # 全データ - 全平均
val_set <- val_mean_table - all_mean_table # 科目平均 - 全平均
pop_set <- pop_mean_table - all_mean_table # 人平均 - 全平均
residual <- all_data - all_mean_table - val_set - pop_set # 残差
# print(residual)

all_sum <- sum(all_set^2) # 全体平方和
val_sum <- sum(val_set^2) # 条件平方和
pop_sum <- sum(pop_set^2) # 個人差平方和
res_sum <- sum(residual^2) # 残差平方和
print(c(all_sum, val_sum, pop_sum, res_sum))
print(round(all_sum, 5) == round(val_sum+pop_sum+res_sum, 5))

# f値の算出
## F = (条件平方和/条件の自由度)/(残差平方和/残差の自由度)
val_df <- ncol(all_data)-1
pop_df <- nrow(all_data)-1
f_1 <- val_sum/val_df
f_2 <- res_sum/(val_df*pop_df)
f_value <- f_1 / f_2
print(data.frame(val=f_value, row.names="f_value"))

# 自由度の考え方は以下
## 残差以外：データの個数-1, 残差：条件df X 個人差df
