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

# Rにおけるデータフレーム
## data.frameを利用した直接指定方法
df_1 <- data.frame(name=c("鳥谷", "赤星", "シーツ", "金本", "ウィリアム", "久保田", "藤川"),
                   blood=c("B", "A", "A", "O", NA, "AB", "A"),
                   height=c(179,170,188,180,183,181,184),
                   weight=c(82,67,89,88,89,94,83),
                   age=c(26,31,36,39,35,26,27)
                   )
print(df_1)

## attachとdettach
## 同じ列名を持つ2つのデータフレームをattachした場合、警告が表示され新しいものに上書きされる
## 余計な手間を省くためにも不要なデータフレームはdettachしておくのが良い

## 既にあるベクトルを利用したデータフレームの作成
name <- c("鳥谷", "赤星", "シーツ", "金本", "ウィリアム", "久保田", "藤川")
blood <- c("B", "A", "A", "O", NA, "AB", "A")
height <- c(179,170,188,180,183,181,184)
weight <- c(82,67,89,88,89,94,83)
age <- c(26,31,36,39,35,26,27)
df_2 <- data.frame(name=name, blood=blood, height=height, weight=weight, age=age)
print(df_2)

## 既にある行列をデータフレームに変換
damy_table <- matrix(c(1:12), 4, 3)
df_3 <- data.frame(damy_table)
print(df_3)
## 列名を変えたい場合はcolnamesを利用
colnames(df_3) <- c("A", "B", "C")
print(df_3)

# データフレームをデータエディタウィンドウで編集
## edit(df_1) # RStudio Cloudではサポートしていない