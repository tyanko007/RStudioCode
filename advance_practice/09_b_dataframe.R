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

