# 中央値を用いた標準分布を確認
source("/cloud/project/myfunc/varp.R")

mean_variance = numeric(length=10000)
median_variance = numeric(length=10000)

for(i in 1:10000){
  sample = rnorm(n=10, mean=50, sd=10) # N(50, 10^2)のランダムサンプリング
  mean_variance[i] = mean(sample) # 標本分散
  median_variance[i] = median(sample) # 不偏分散
}

# 平均値と中央値の集計値の確認
conf_1 = function(a,b){
  print("それぞれの平均")
  print(mean(a))
  print(mean(b))
  print("それぞれの標準偏差")
  print(sd(a))
  print(sd(b))
  print("それぞれのヒストグラム")
  hist(a)
  hist(b)
}


conf_1(mean_variance, median_variance)