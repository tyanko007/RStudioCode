# 書籍第4章章末問題
# Q1:N(50, 10^2)の正規母集団からn=10の標本抽出を5000回繰り返すことにより、標本平均の経験的な標本分布を求めてください
## 合わせてその理論値も重ね合わせる
# Q2: 理論的な標本分布について、n=1,4,9,16,25と変化させた時に、標本分布の形状がどのように変わるかを調べてみる
## 母集団分布は標準正規分布 N(0, 1^2)とする
## > サンプルサイズが大きくなるにつれ標本分布は中央に集約、推定値が大きい値が減少する傾向がある

quest_1 = function(){
  sample_variance = numeric(length=5000)
  for (i in 1:5000){
    sample = rnorm(10, mean=50, sd=10)
    sample_variance[i] = mean(sample)
  }
  hist(sample_variance, freq=FALSE)
  curve(dnorm(x, mean=50, sd=sqrt(10)), add=TRUE)
  print("結果はPlotコンソールを確認してください")
}

quest_2 = function(a = c(1,4,9,16,25)){
  mod = function(x){
    sample_variance = numeric(length=5000)
    for (i in 1:5000){
      sample = rnorm(x, mean=0, sd=1)
      sample_variance[i] = mean(sample)
    }
    hist(sample_variance, freq=FALSE, main=paste("sample size is", x))
  }
  
  for(i in 1:length(a)){
    mod(a[i])
  }
}

section4 = function(){
  quest_1()
  quest_2()
}