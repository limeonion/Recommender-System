library(ggplot2)
library(readr) 
library(NMF)
library(data.table)

train <- fread('/home/shreyas/sta proj/train_ver2.csv')
test <- fread('/home/shreyas/sta proj/test_ver2.csv')

train_trx <- train[,c(2,25:48),with=FALSE]
rm(train)
train_trx_1=train_trx[, lapply(.SD, max), by=c("ncodpers")]

rm(train_trx)
train_trx_1[is.na(train_trx_1)] <- 0

# Run SVD
svd1 <- svd(array(train_trx_1[,2:25,with=FALSE]),nu=4,nv=4)
print("SVD done")

# Get pref
pr_pref <- ((svd1$u %*% diag(sqrt(svd1$d[1:4])))) %*% (diag(sqrt(svd1$d[1:4])) %*% t(svd1$v))
pr_pref <- data.frame(pr_pref)
colnames(pr_pref) <- names(train_trx_1)[2:25]
pr_pref$ncodpers <- train_trx_1$ncodpers

pr_pref_melt <- melt(pr_pref,id.vars = "ncodpers")
names(pr_pref_melt) <- c("ncodpers" ,"prod", "pr_prf")

train_trx_1_melt <- melt(train_trx_1,id.vars = "ncodpers")
names(train_trx_1_melt) <- c("ncodpers" ,"prod", "pur")
set.seed(1)
train_trx_1_melt <- train_trx_1_melt[ncodpers %in% unique(test$ncodpers),]
train_trx_1_melt <- train_trx_1_melt[pur==0,]
train_trx_1_melt$pur <- NULL

print("Subset done")
train_trx_1_melt <- merge(train_trx_1_melt,pr_pref_melt, by =c("ncodpers" ,"prod"))
train_trx_1_melt<-train_trx_1_melt[order(ncodpers,-pr_prf),]
train_trx_1_melt<-train_trx_1_melt[, head(.SD, 7), by=ncodpers]

# Submission
print("Score done")
train_trx_1_melt <- train_trx_1_melt[,list(added_products=paste(unique(prod),collapse=" ")), by=c("ncodpers")]
print("Submission")
write.csv(train_trx_1_melt,file="submission1.csv", row.names = F)