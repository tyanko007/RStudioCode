# 3要素以上の平均値を比較するための統計的方法の実装

dataset <- read.csv("/cloud/project/csv/learn_way_data.csv")
class_a <- NULL
class_b <- NULL
class_c <- NULL
class_d <- NULL
for(i in 1:20){
  if(dataset[["Learn"]][i] == "A"){
    class_a[length(class_a) + 1] <- dataset["Stats_test.2"][,1][i]
  }else if(dataset[["Learn"]][i] == "B"){
    class_b[length(class_b) + 1] <- dataset["Stats_test.2"][,1][i]
  }else if(dataset[["Learn"]][i] == "C"){
    class_c[length(class_c) + 1] <- dataset["Stats_test.2"][,1][i]
  }else{
    class_d[length(class_d) + 1] <- dataset["Stats_test.2"][,1][i]
  }
}

# print(c(class_a, "/",class_b, "/",class_c, "/" ,class_d))

# 3要素以上での平均値差の検定は分散分析と呼びt分布とは別の手法を実施する
## t分布は3要素以上の分析には利用できないため

# 一元配置分散分析(対応なし)

# flow1: 帰無仮説と対立仮説の設定
## H0: 4郡の母平均は等しい(指導法による点数の違いはない)
## H1: 4郡の母平均は等しくない(指導法により点数の違いがある)

# flow2: 検定統計量の選択
## F = (群間平方和/郡間の自由度) / (郡内平方和/郡内の自由度)
## F分布を利用。dfは2つ(分子と分母でそれぞれ)
curve(df(x, 3, 16), 0, 5) #F分布の確率密度の算出

# flow3: 有意水準の決定：5%の片側検定

# flow4: 検定統計量の計算
stats_2 <- c(class_a, class_b, class_c, class_d)
learn_way <- c(rep("A",5), rep("B",5), rep("C",5), rep("D",5))
# print(data.frame(stats_2, learn_way))
learn_way2 <- factor(learn_way) # 文字型から要因型へ変換
# print(learn_way2)

# oneway.test:一元配置分散分析のみ実施可能な分散分析用関数
print(oneway.test(stats_2~learn_way2, var.equal = TRUE)) 
# aov:最も一般的な分散分析用関数
print(summary(aov(stats_2~learn_way2)))
# anova:複数のモデルの比較など高度な分析にも対応している分散分析関数
print(anova(lm(stats_2~learn_way2)))

# flow5: 帰無仮説の棄却or採択の決定
## 例題では5%で有意であるといえる

# 平方和に関して
all <- cbind(class_a, class_b, class_c, class_d)
# print(all)
class_mean <- colMeans(all)
# print(class_mean)
all_mean <- mean(all)
# print(all_mean)

## 行列のデータと同じ形式で全平均を入力した表を作成
all_mean_table <- matrix(rep(all_mean, 20), nrow=5, ncol=4)
# print(all_mean_table)
## 郡平均を要素とする行列の作成
class_mean_table <- matrix(rep(class_mean, 5), nrow=5, ncol=4, byrow=TRUE)
# print(class_mean_table)

# 平方和の計算
## 各データ - 全平均の差(全体)
all_data <- all - all_mean_table
# print(all_data)
## 郡平均 - 全平均の差(群間)
class_data <-  class_mean_table - all_mean_table
# print(class_data)
## 各データ - 郡平均の差(郡内)
class_data2 <- all - class_mean_table
# print(class_data2)

# 各値の平方和
all_sum <- sum(all_data^2) # 全体平方和(全体^2)
class_sum <- sum(class_data^2) # 群間平方和(群間^2)
class_sum2 <- sum(class_data2^2) # 郡内平方和(郡内^2)
print(data.frame(value=c(all_sum, class_sum, class_sum2), row.names=c("全体平方和", "郡間平方和", "郡内平方和")))

# 各自由度の算出
class_col_df <- ncol(all) - 1 # 群間自由度
class_row_df <- (nrow(all)-1) * ncol(all) # 郡内自由度
all_df <- length(all)-1 # 全体自由度
print(data.frame(df=c(class_col_df, class_row_df, all_df), row.names=c("群間自由度", "郡内自由度", "全体自由度")))

# 平均平方: 平方和/自由度
class_mean_sum <- class_sum / class_col_df # 群間平均平方
class_mean_sum2 <- class_sum2 / class_row_df # 郡内平均平方
print(data.frame(value=c(class_mean_sum, class_mean_sum2), row.names=c("群間平均平方", "郡内平均平方")))

# F値の計算: 群間平均平方 / 郡内平均平方
f_value <- class_mean_sum / class_mean_sum2
print(data.frame(F=f_value, row.names="F値"))

# 群間同士の比較(多重比較 Tukeyの方法)
## 検定統計量 p=|比較する郡の平均値差|/√郡内の平均平方/各郡のデータ数
##例: AとDの比較
class_a_mean <- mean(class_a)
class_d_mean <- mean(class_d)
p_1 <- abs(class_a_mean - class_d_mean)
p_2 <- sqrt(class_mean_sum2 / nrow(all))
p_value <- p_1/p_2
p_line <- qtukey(0.95, 4, 16)
#p_line <- qtukey(0.05, 4, 16, lower.tail=FALSE)
print(data.frame(val=c(p_value, p_line), row.names=c("P", "0.95")))

## 関数での実装
print(TukeyHSD(aov(stats_2~learn_way2)))