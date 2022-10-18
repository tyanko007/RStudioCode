## さまざまなデータファイルの読み込み

# テキストファイル
textfile <- read.table("/cloud/project/advance_practice/brank_files/textfile.txt", header = TRUE)
print(textfile)

# csvファイル
csvfile <- read.csv("/cloud/project/advance_practice/brank_files/csvfile.csv")
print(csvfile)

# jsonファイル
jsonfile <- fromJSON("/cloud/project/advance_practice/brank_files/jsonfile.json")
print(jsonfile)


