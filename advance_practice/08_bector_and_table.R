# 応用編8章　ベクトルと行列の基礎

# スカラー > 単一の値
scalar <- 1
print(append("スカラー", scalar))
# ベクトル > 縦もしくは横に並べた複数の値
vector <- c(1,2,3)
print(c("ベクトル", vector))

# 連続数の生成
sample1 <- 1:10
sample2 <- -5:5
sample3 <- 10:1
sample4 <- seq(1,10,2)
sample5 <- rep(c("a","b","c"),3)
print(sample4)
print(sample5)

# 内積の計算
print(sample1%*%sample3)

# 要素の取り出し
print(sample1[3])
print(sample1[2:7])

# 行列
mat <- matrix(1:12, nrow=3, ncol=4)
print(mat)
mat_byrow <- matrix(1:12,3,4, byrow=TRUE)
print(mat_byrow)
col_bind <- cbind(sample1[1:5], sample4)
print(col_bind)
row_bind <- rbind(sample1[1:5],sample4)
print(row_bind)

# 行列の基本演算
calc_table <- matrix(1:15, 3, 5)
print(calc_table)
# +, -, *, /, %%(余剰), で計算可能
print(calc_table%%3)

# 行列の転置(切り替え)
print(t(mat))

# 行列の積
print(mat%*%t(mat))
print(t(mat)%*%mat)
print(matrix(c(1,2,3,4),2,2,byrow=TRUE)%*%rbind(4,5))
