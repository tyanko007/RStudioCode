#　検定を行う意義として、母集団と標本の分布を図示

# 確率は固定
set.seed(60750)
A <- rnorm(50)
B <- rnorm(50)

mental <- 10*A+50
communicatin <- 10*B+50

plot(mental, communicatin, xlim=c(0,100), ylim=c(0,100))
points(50, 50, cex=45)
legend(50, 10, legend="抽出された標本に含まれるデータ", pch=1)
legend(10, 100, legend="母集団(円全体にデータが散らばっていて相関はゼロ)")

