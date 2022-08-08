# 標本抽出を繰り返し実施して、無作為抽出で得た値に意味があるかを推定する
# モンテカルロ法の実装

callback = numeric(length=10000) #数値型の配列を定義

for(i in 1:10000){
  sd_sample = rnorm(n=10, mean=50, sd=10) # N(50, 10^2)の標本を抽出
  callback[i] = mean(sd_sample)
}

hist(callback, freq = FALSE)

# +-5を閾値とし他場合の測定値の数
center_five = ifelse(abs(callback-50)<=5, 1, 0)
print(table(center_five))
