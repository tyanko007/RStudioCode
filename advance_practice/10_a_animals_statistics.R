# openleaan転載データを利用した分析練習
## 参考：https://www.open.edu/openlearn/science-maths-technology/mathematics-statistics/exploring-data-graphs-and-numerical-summaries/content-section-2.6

# 28種類の動物の体格と脳データとの比較

source_file<- read.csv("/cloud/project/csv/28AnimalsDefineData.csv")
# print(brain_data[,1])
brain_data <- data.frame(Species=source_file[,1], Body_weight=source_file[,2], Brain_weight=source_file[,3])

# 脳データと体重データの散布図
plot(brain_data$Body_weight, brain_data$Brain_weight)

# 脳データと体重データの相関係数
brain_mean <- mean(brain_data[,3])
brain_var <- sum(brain_data[,3]^2 - brain_mean)/length(brain_data[,1])
brain_sd  <- sqrt(brain_var)

body_mean <- mean(brain_data[,2])
body_var <- sum(brain_data[,2]^2 - body_mean)/length(brain_data[,1])
body_sd  <- sqrt(body_var)

brain_and_body <- sum((brain_data[,3]-brain_mean)*(brain_data[,2]-body_mean))/length(brain_data[,1])
cor_value <- brain_and_body / (brain_sd*body_sd)

# 外れ値の除外(体重10000kg以下)
brain_logic <- brain_data[,2] < 80000
brain_data2 <- brain_data[brain_logic,]
plot(brain_data2$Body_weight, brain_data2$Brain_weight)
cor_value2 <- cor(brain_data2$Body_weight, brain_data2$Brain_weight)
# 外れ値の除外(体重2000kg以下)
brain_logic2 <- brain_data[,2] < 2000
brain_data3 <- brain_data[brain_logic2,]
plot(brain_data3$Body_weight, brain_data3$Brain_weight)
cor_value3 <- cor(brain_data3$Body_weight, brain_data3$Brain_weight)