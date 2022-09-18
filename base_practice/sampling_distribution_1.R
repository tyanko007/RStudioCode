# 標本分散と不偏分散の標本分布
# 不偏分散の不偏推定量の性質を「経験的な標本分布」を用いて確認

source("/cloud/project/myfunc/varp.R")

sample_variance = numeric(length=10000)
unbiased_variance = numeric(length=10000)

for(i in 1:10000){
  sample = rnorm(n=10, mean=50, sd=10) # N(50, 10^2)のランダムサンプリング
  sample_variance[i] = varp(sample) # 標本分散
  unbiased_variance[i] = var(sample) # 不偏分散
}

#標本分散と不偏分散の集計値の特徴を確認
conf_1 = function(a,b){
  print("標本分散と不偏分散")
  print(mean(a))
  print(mean(b))
  print("標準偏差")
  print(sd(a))
  print(sd(b))
  print("それぞれのヒストグラム")
  hist(a, breaks=seq(0, 500, 10))
  hist(b, breaks=seq(0, 500, 10))
}

# 推定値が大きい場合の比較
conf_2 = function(a, b){
  big_spvar = ifelse(a >= 200, 1, 0)
  big_unvar = ifelse(b >= 200, 1, 0)
  print("標本分散の推定値が大きい値の集計")
  print(table(big_spvar))
  print("不偏分散の推定値が大きい値の集計")
  print(table(big_unvar))
}

# 標準偏差が不偏ではないことを確認
# N(50, 10^2)=標準偏差=10 に対して若干小さく算出される
conf_3 = function(x){
  print(mean(sqrt(x)))
}

#conf_1(sample_variance, unbiased_variance)
#conf_2(sample_variance, unbiased_variance)
conf_3(unbiased_variance)
