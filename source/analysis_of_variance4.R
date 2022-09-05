## 二元配置分散分析(対応あり)&(一要因のみ対応あり)

# 対応ありの検定
## 例：3種類のミネラルウォーター(イアカン、ボスビッグ、ビビッテル)の冷蔵・常温の評価を5人の評価者を用いて評価された結果の検定

# flow1:帰無仮説と対立仮説の決定
## 主要因(味), H0: 味による母平均の差はない
## 主要因(温度), H0: 温度による母平均の差はない
## 交互作用効果, H0: 味と温度による相性の良し悪しはない
# flow2: 有意水準は5%, 片側検定
# flow3: 検定統計量の決定：F分布を利用

# flow4: 検定統計量の算出
taste <- c(6,4,5,3,2,10,8,10,8,9,11,12,12,10,10,5,4,2,2,2,7,6,5,4,3,12,8,5,6,4)
temp <- c(rep("cold", 15), rep("default", 15))
prod <- factor(rep(c(rep("iakan", 5),rep("busbig", 5),rep("bibitel",5)),2))
name <- factor(rep(c("matsumura", "kawasaki", "iguti", "matsunaka", "zyoshima"),6))

print(summary(aov(taste~temp*prod+Error(name+name:temp+name:prod+name:temp:prod))))

# flow5: 帰無仮説の棄却or採択
## 結果から全ての要因において5%有意と認められる

# 一要因のみ対応ありの検定
## 例：条件の違いは評価者が10名とし、温度は片方のみ評価するという形にした場合

# flow1~3は同じ
# flow4 検定統計量の算出
name2_id <- factor(c(rep(c(1:5),3), rep(c(6:10),3)))
print(summary(aov(taste~temp*prod+Error(name2_id:temp+name2_id:temp:prod))))

# flow5: 帰無仮説の棄却or採択
## 全ての要因において5%有意である