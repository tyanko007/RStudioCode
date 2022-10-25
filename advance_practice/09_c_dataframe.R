# 9章での書籍のトピックや使い方をまとめておく

data <- read.csv("/cloud/project/csv/learn_way_data.csv")

# データフレームの変数の指定は$、attachを利用することで省略できる
attach(data)
print(Heart)
print(Learn)

# データフレームにおける量的データはfor文を利用することでまとめて指定も可能
for_sample <- numeric(3)
for_count <- 0
for (i in 6:8){
  for_count <- for_count + 1
  for_sample[for_count] <- mean(data[,i])
}
print(for_sample)