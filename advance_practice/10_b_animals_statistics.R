# 10章の参考を記載する

# データフレームの構造(条件に関して)
## 構造上、列には変数、行には値が存在するため[]の左側は値に関する条件を
## 右側は変数に関する条件を入力することになる
dataset <- read.csv("/cloud/project/csv/28AnimalsDefineData.csv")
only_bodyweight <- dataset[,1:2]
brain_10low <- dataset[dataset[,3]<10,]