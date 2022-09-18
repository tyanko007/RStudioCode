# t検定を実施するための原則
## 1: 無作為抽出
## 2: 正規性：標本分布が正規分布に従う
## 3: 分散の等質性:2つの母集団の分散が等質であること
# 分散の等質性をF検定で求める

class_a <- c(54,55,53,48,50,38,41,40,53,52)
class_b <- c(67,63,50,60,61,69,43,58,36,29)

# 帰無仮説は、2変数の分散は一致する
print(var.test(class_a, class_b))

# 分散の等質性が証明できない場合、通常のt検定ではなくWelch検定を実施する
## t.test(a, b, option{var.equal=FALSE}) ※ var.equalのdefaultはTRUE
print(t.test(class_a, class_b))
