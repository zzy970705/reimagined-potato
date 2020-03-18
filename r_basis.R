#清除当前环境下全部对象
rm(list = ls())

#加载R包自带数据集，并保存
data() 
library(ade4)
data(package = "ade4")
data("doubs")
str(doubs)
write.csv(doubs$env, "data/doubs_env.csv")

# 读取保存数据，并查看数据结构
mydata <- read.csv("data/doubs_env.csv")
head(mydata)
mydata <- mydata[,-1]
head(mydata)
hist(mydata$alt,
     col = "green",
     main = "altitude distribution",
     xlab = "altitude")

#变量间相关性分析（显著性检验），可视化,保存相关结果
library(corrplot)
res1 <- cor(mydata)
res1
write.table(res1,"results/coeff.txt",sep="\t")
library(psych)
res2 <- corr.test(mydata)
res2$r
res2$ci
corr_fig <- corrplot(res1)
pairs.panels(mydata[,2:6])

