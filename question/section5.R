# 書籍第5章章末問題
# Q1: 母集団分布がN(170, σ^2)に従う時、以下の調査結果がランダムサンプリングと捉えられるかの検定
## t検定を実施。t.test関数を使用すること
# Q2: 第3章の章末問題(quest1)を参照。勉強時間と定期試験の相関係数の無相関検定を実施
# Q3: Q2におけるスピアマンの順位相関係数とケンドールの順位相関係数を求めた検定も実施
# Q4: 第3章の章末問題(quest3)を参照。洋食派と和食派のカイ二乗検定を実施
# Q5: 本書データの無相関検定の実施。有意水準は5%

section5 <- function(){
  quest_1 <- function(a,b){
    # 有意水準は5%
    # print(t.test(a,mu=170))
    # print(t.test(b,mu=170))
    print(t.test(append(a,b),mu=170))
  }
  quest_2 <- function(a,b){
    # 検定統計量: t = r*sqrt(n-2)/sqrt(1-r^2)
    # 有意水準は5% 両側検定(= or != かの検定)
    
    ## 相関係数
    #print(cor.test(a,b)) # 関数
    cor_1 <- sum((a-mean(a))*(b-mean(b))) / length(a)
    cor_2 <- sqrt(sum((a-mean(a))^2/length(a))) * sqrt(sum((b-mean(b))^2/length(b)))
    cor_hand <- cor_1/cor_2
    
    # 検定統計量の計算
    t_1 <- cor_hand * sqrt(length(a)-2)
    t_2 <- sqrt(1-cor_hand^2)
    t_value = t_1/t_2
    # t分布に合わせた上下側確率値を算出
    t_bottom <- qt(0.025, length(a)-2)
    t_upper <- qt(0.025, length(a)-2, lower.tail = FALSE)
    # 計測結果
    label <- c("実測値", "0.025", "0.975")
    result <- c(t_value, t_bottom, t_upper)
    print("勉強時間(h)と点数の無相関検定")
    print(data.frame(result, row.names=label))
  }
  
  quest_3 <- function(a,b){
    # スピアマンの順位相関係数
    print(cor.test(a,b, method="spearman"))
    # ケンドールの順位相関係数
    print(cor.test(a,b, method="kendall"))
  }
  
  quest_4 <- function(a,b){
    # 検定統計量: X^2 = (O1-E1)^2/E1 + (O2-E2)^2/E2 + ...
    ## 自由度は2x2のクロス集計表なので1
    # 有意水準 5% 片側検定(カイ二乗分布は正の値しか取らないため)
    
    ## クロス集計用の関数
    cross_func <- function(x,y,flag=0){
      if(flag == 0){
        print("引数なしでは実行不可です")
      }else if(flag==1){
        tmp <- ifelse(x == 2, 1, 0) + ifelse(y == 2, 1, 0)
      }else if(flag==2){
        tmp <- ifelse(x == 1, 1, 0) + ifelse(y == 2, 1, 0)
      }else if(flag==3){
        tmp <- ifelse(x == 2, 1, 0) + ifelse(y == 1, 1, 0)
      }else if(flag==4){
        tmp <- ifelse(x == 1, 1, 0) + ifelse(y == 1, 1, 0)
      }
      
      cross_func <- sum(ifelse(tmp == 2, 1, 0))
      
    }
    
    # print(chisq.test(table(a,b), correct=FALSE)) # 関数
    total = length(a)
    a2 <- ifelse(a == "洋食", 2, 1) # 洋食=2, 和食=1に置き換え
    b2 <- ifelse(b == "甘党", 2, 1) # 甘党=2, 辛党=1に置き換え
    yo_ama_c <- cross_func(a2,b2,1) # 洋食&甘党の観測度数
    wa_ama_c <- cross_func(a2,b2,2) # 和食&甘党の観測度数
    yo_kara_c <- cross_func(a2,b2,3) # 洋食&辛党の観測度数
    wa_kara_c <- cross_func(a2,b2,4) # 和食&辛党の観測度数
    yo_ama_x <- (sum(yo_ama_c, wa_ama_c) * sum(yo_ama_c, yo_kara_c)) / total # 洋食&甘党の期待度数
    wa_ama_x <- (sum(yo_ama_c, wa_ama_c) * sum(wa_ama_c, wa_kara_c)) / total # 和食&甘党の期待度数
    yo_kara_x <- (sum(yo_kara_c, wa_kara_c) * sum(yo_ama_c, yo_kara_c)) / total # 洋食&辛党の期待度数
    wa_kara_x <- (sum(yo_kara_c, wa_kara_c) * sum(wa_ama_c, wa_kara_c)) / total # 和食&辛党の期待度数
    real <- c(yo_ama_c, wa_ama_c, yo_kara_c, wa_kara_c)
    x_point <- c(yo_ama_x, wa_ama_x, yo_kara_x, wa_kara_x)
    # カイ二乗係数の算出
    x_value <- sum((real-x_point)^2/x_point)
    x_line <- qchisq(0.95, 1)
    print("食の好みと味覚の独立性の検定。帰無仮説は独立である")
    print(table(a,b))
    print(data.frame(c(x_line, x_value), row.names=c("X^2","実数")))
  }
  
  quest_5 <- function(a,b){
    # サンプルサイズが等倍の時
    print(cor.test(a,b))
    
    # サンプルサイズが2倍の時
    a2 = rep(a, 2)
    b2 = rep(b, 2)
    print(cor.test(a2, b2))
    
    # 自由度に合わせた作図(t分布)
    curve(dt(x, 3), -5,5, col="red")
    curve(dt(x, 8), add=TRUE, col="blue")
    abline(v=qt(0.025, 3), col="red")
    abline(v=qt(0.975, 3), col="red")
    abline(v=qt(0.025, 8), col="blue")
    abline(v=qt(0.975, 8), col="blue")
  }
  
  height_1 <- c(165,150,170,168,159,170,167,178,155,159)
  height_2 <- c(161,162,166,171,155,160,168,172,155,167)
  quest_1(height_1, height_2)
  
  study <- c(1,3,10,12,6,3,8,4,1,5)
  score <- c(20,40,100,80,50,50,70,50,10,60)
  quest_2(study, score)
  quest_3(study, score)
  
  food <- c("洋食","和食","和食","洋食","和食","洋食","洋食","和食","洋食","洋食","和食","洋食","和食","洋食","和食","和食","洋食","洋食","和食","和食")
  taste <- c("甘党","辛党","甘党","甘党","辛党","辛党","辛党","辛党","甘党","甘党","甘党","甘党","辛党","辛党","甘党","辛党","辛党","甘党","辛党","辛党")
  quest_4(food, taste)
  
  language = c(60,40,30,70,55)
  social = c(80,25,35,70,50)
  quest_5(language, social)
} 

section5()