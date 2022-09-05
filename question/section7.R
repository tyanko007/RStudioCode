# 書籍章末問題:7章
## quest1: ある大学の学部(法,文,理,工)から8名の無作為抽出を行った
### 学部間でのテスト結果の母平均に差があるかの分散分析を実施してください
## quest2: 統計学の学習方法(講義,問題演習,実習)の3つの形態をそれぞれ7名に実施
### 各学習方法における定着度テストでの母平均に差があるかの分散分析を実施してください

section7 <- function(){
  quest_1 <- function(test, faculty, num){
    #test：テスト結果の配列を想定
    #faculty: 学部の配列を想定
    #num: 抽出結果の数を想定
    
    faculty_fac <- factor(c(rep(faculty[1],num), rep(faculty[2], num), rep(faculty[3], num), rep(faculty[4], num)))
    # print(faculty_fac)
    print(summary(aov(test~faculty_fac)))
    
    # 表の考え方は、各要因(列)に各データが並ぶ(行)という縦型に伸びる形
    test_table <- matrix(test, nrow=8, ncol=4)
    mean_table <- matrix(mean(test), nrow=8, ncol=4)
    faculty_mean_table <- matrix(rep(colMeans(test_table),4),nrow=8, ncol=4, byrow=TRUE)
    # print(faculty_mean_table)
    # 郡間平方和・自由度の計算
    gunkan <- faculty_mean_table - mean_table
    gunkan_sum <- sum(gunkan^2)
    gunkan_df <- ncol(test_table)-1
    # print(c(gunkan_sum, gunkan_df))
    # 郡内平方和・自由度の計算
    gunnai <- test_table - faculty_mean_table
    gunnai_sum <- sum(gunnai^2)
    gunnai_df <- (nrow(test_table)-1)*ncol(test_table)
    # print(c(gunnai_sum, gunnai_df))
    # f値の計算
    f_1 <- gunkan_sum/gunkan_df
    f_2 <- gunnai_sum/gunnai_df
    f_value <- f_1/f_2
    f_line <- qf(0.05, gunkan_df, gunnai_df, lower.tail=FALSE)
    print(data.frame(val=c(f_value, f_line), row.names=c("f_value", "0.95")))
  }
  quest_2 <- function(){
    print("--")
  }
  
  test_data <- c(75,61,68,58,66,55,65,63,62,60,66,63,55,53,59,63,65,60,78,52,59,66,73,64,52,59,44,67,47,53,58,49)
  # print(length(test_value))
  faculty_data <- c("jurisprudence", "literature", "science", "engineering")
  quest_1(test_data, faculty_data, 8)
}

section7()