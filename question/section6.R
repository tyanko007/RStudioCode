# 書籍第6章章末問題
## Q1: 「指導法データ」の「統計テスト1」の得点について、統計が好きか嫌いかによって2群の平均値に有意な差はあるか
## Q2: 「指導法データ」の「心理学テスト」の得点について、男女で有意な差はあるか
## Q3: 本書サンプルデータから、ダイエットプログラムは効果があるといえるか

section6 <- function(){
  quest_1 <- function(a= c(70,66,54,60,59),b= c(50,43,59,61,55), len=TRUE){
    # 帰無仮説: 両郡に対する母平均に差はない(得手不得手での差はない)
    
    # サンプルサイズの違いによる検定統計量
    ## aN = bN: t = D' / (σ^d / √n)
    ## aN != bN t = a'-b' / √(σ^x/aN)+(σ^x/bN)
    ### σ^x = ((aN-1)*var(a)+(aN-1)*var(b)) / aN+aN-2
    if(len==TRUE){
      # print(t.test(a, b, paired=TRUE)) # 関数での実装
      c <- length(a)
      D_data <- a-b
      D_sd <- sd(D_data)
      D_mean <- mean(D_data)
      t_value <- D_mean / (D_sd/sqrt(c))
    }else{
      a_sd <- sd(a)
      b_sd <- sd(b)
      sp_1 <- (length(a)-1)*a_sd + (length(a)-1)*b_sd
      sp_value <- sp_1 / length(a)+length(a)-2
      t_1 <- mean(a)-mean(b)
      t_2 <- sqrt(sp_value/length(a) + sp_value/length(b))
      t_value <- t_1 / t_2
    }

    t_upper <- qt(0.975, c-1)
    t_lower <- qt(0.025, c-1)
    print("aとbにおける平均値の差の検定")
    print(data.frame(value=c(t_value, t_upper, t_lower), row.names=c("t_value", "0.975", "0.025")))
    print(ifelse(t_value<t_lower || t_value>t_upper, "平均値に差はある(5%の両側検定で有意である)", "平均値に差があるとは言えない"))
  }
  
  quest_3 <- function(a,b){
    print(t.test(a,b, paired = TRUE))
  }
  
  
  dataset <- read.csv("/cloud/project/csv/learn_way_data.csv")
  
  like <- NULL
  unlike <- NULL
  for(i in 1:20){
    if(dataset[["Statistics"]][i] == "好き"){
      like[length(like) + 1] <- dataset["Stats_test.1"][,1][i]
    }else{
      unlike[length(unlike)+1] <- dataset["Stats_test.1"][,1][i]
    }
  }
  # print(like)
  # print(unlike)
  quest_1(like, unlike, len=FALSE)
  
  male <- NULL
  female <- NULL
  for(i in 1:20){
    if(dataset[["Sex"]][i] == "男"){
      male[length(male)+1] <- dataset["Heart"][,1][i]
    }else{
      female[length(female)+1] <- dataset["Heart"][,1][i]
    }
  }
  # print(male)
  # print(female)
  quest_1(male, female,len = TRUE)
  
  before_diet_program <- c(61,50,41,55,51,48,46,55,65,70)
  after_diet_program <- c(59,48,33,54,47,52,38,50,64,63)
  quest_3(before_diet_program, after_diet_program)
}