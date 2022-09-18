# 第3章演習問題
# Q1 大学生の勉強時間(x)と定期試験(y)の散布図を作成
# Q2 上図の相関係数を算出
# Q3 20名の食の好みをクロス集計票で作成

section3 = function(){
  quest_1 = function(x,y){
    plot(x,y)
  }
  
  quest_2 = function(x,y){
    collback = cor(x,y)
    collback
  }
  
  quest_3 = function(x,y){
    print(table(x,y))
  }
  
  study = c(1,3,10,12,6,3,8,4,1,5)
  score = c(20,40,100,80,50,50,70,50,10,60)
  food = c("洋食","和食","和食","洋食","和食","洋食","洋食","和食","洋食","洋食","和食","洋食","和食","洋食","和食","和食","洋食","洋食","和食","和食")
  taste = c("甘党","辛党","甘党","甘党","辛党","辛党","辛党","辛党","甘党","甘党","甘党","甘党","辛党","辛党","甘党","辛党","辛党","甘党","辛党","辛党")
  
  print("plot(study, score)")
  quest_1(study, score)
  print("cor(stady, score)")
  print(quest_2(study, score))
  print("cross stats table")
  quest_3(food, taste)
}

section3()