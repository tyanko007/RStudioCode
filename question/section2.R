# 第２章演習問題
# Q1: A大学、B大学のテレビの視聴時間のヒストグラム化
# Q2: 大学ごとの平均、標準偏差を求める
# Q3: 大学ごとの標準化

quest_1 = function(a, b){
  f = FALSE
  if(is.numeric(a)&is.numeric(b)){
    print("A college histgram")
    hist(a)
    print("B college histgram")
    hist(b)
    f = TRUE
    f
  }else{
    f
  }
}

quest_2 = function(a,b){
  print("a college data. 1. mean, 2. sd")
  print(mean(a))
  print(sqrt(var(a)*(length(a)-1)/length(a)))
  print("b college data. 1. mean, 2. sd")
  print(mean(b))
  print(sqrt(var(b)*(length(b)-1)/length(b)))
}

quest_3 = function(a,b){
  print("a college standard")
  a_mean = mean(a)
  a_sd = sqrt(var(a)*(length(a)-1)/length(a))
  print((a-a_mean)/a_sd)
  print("b college standard")
  b_mean = mean(b)
  b_sd = sqrt(var(b)*(length(b)-1)/length(b))
  print((b-b_mean)/b_sd)
}

section2 = function(){
  A_college = c(60,100,50,40,50,230,120,240,200,30)
  B_college = c(50,60,40,50,100,80,30,20,100,120)
  flag = quest_1(A_college, B_college)
  if(flag == TRUE){
    quest_2(A_college, B_college)
    quest_3(A_college, B_college)
  }else{
    print("quest_1のデータ型が数値型ではないです")
  }
}