# データフレームを用いた7章までの分析 ~復習~

data = read.csv("/cloud/project/csv/learn_way_data.csv")
print(data)

# 第2章
tl_a = table(data$Learn)
print(tl_a)
tl_b = table(data[,9])
print(tl_b)
tl_c = table(data[9,])
print(tl_c)
## 指導法データのヒストグラム
hist(data$Heart)
## hist(data[,6]) # こっちでも可

heart_me <- mean(data[,6])
heart_var <- sum((data[,6]-heart_me)^2)/length(data[,6]) 
heart_sd <- sqrt(heart_var)
## 不偏分散、不偏標準偏差は関数で実装可能
heart_var2 <- var(data[,6])
heart_sd2 <- sd(data[,6])
heart_max <- max(data[,6])
heart_min <- min(data[,6])
print(data.frame(value=c(heart_me, heart_var, heart_sd, heart_var2, heart_sd2,heart_max, heart_min), name=c("平均", "母分散", "母標準偏差", "不偏分散", "不偏標準偏差", "最大値", "最小値")))
## z得点と偏差値
heart_z <- scale(data[,6])
print(heart_z)
heart_hensa <- heart_z*10+50
print(heart_hensa)

# 3章の分析
plot(data[,7], data[,8]) # 統計テスト[12]の散布図
print(cov(data[,7], data[,8])) # 統計テスト[12]の共分散
print(cor(data[,7], data[,8])) # 統計テスト[12]の相関係数
print(table(data[,4], data[,5])) # 数学と統計の好き嫌いをまとめたクロス集計
# print(cor(as.integer(data$Math), as.integer(data$Statistics)))
damy_math <- ifelse(data[,4] != "好き", 1, 2)
damy_sta <- ifelse(data[,5] != "好き", 1, 2)
print(cor(damy_math, damy_sta)) #ファイ係数の計算

# 5章の分析
print(t.test(data$Heart, mu=12)) # 1つの平均値の検定 母分散が未知
print(cor.test(data[,7], data[,8])) # 無相間検定
print(chisq.test(table(data[,4], data[,5]), correct = FALSE)) # 独立性の検定

# 6章の分析
print(t.test(data[,7]~data[,3], var.equal=TRUE)) # 独立な2群のt検定(平均値が男女で有意に異なるか)
## 上記の書き方とは別に、男女でそれぞれ分けた値を参照させることも可能
print(t.test(data[,7], data[,8], paired=TRUE)) # 対応のある独立な2群のt検定

# 7章の検定
print(bartlett.test(data[,8], data[,9])) # 分散の等質性の検定
print(summary(aov(data[,8]~data[,9])))
damy_learn <- factor(data[,9])
# print(summary(aov(data[,8]~damy_learn)))
print(TukeyHSD(aov(data[,8]~damy_learn)))


