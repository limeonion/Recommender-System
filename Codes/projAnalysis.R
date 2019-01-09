#####################
#Data cleaning
######################
#train.data<-read.csv("/home/shreyas/sta proj/train_ver2.csv")  

t<-train
#test.data<-read.csv("/home/shreyas/sta proj/test_ver2.csv")
library(data.table)
library(arules)
t$ncodpers<-NULL
t$pais_residencia<-NULL
t$fecha_dato<-NULL
t$age<-as.integer(t$age)
t[["age"]] <- cut(t$age, breaks=c(0, 15, 45, 56, Inf), labels=c("Young", "Adults", "Seniors", "Elderly"))
t$renta[is.na(t$renta)]<-0
t[["renta"]] <- cut(t$renta,breaks=c(-Inf,50000,100000,200000,1000000,Inf), labels = c("tooLess", "less", "average", "more","tooMore"))
levels(t$sexo) <- c(levels(t$sexo), "female")
levels(t$sexo) <- c(levels(t$sexo), "male")
t$sexo[t$sexo == 'H'] <- 'female'
t$sexo[t$sexo == 'V'] <- 'male'
t$fecha_alta<-NULL
t$nomprov<-NULL
t$tipodom<-NULL
t$indfall<-NULL
t$ind_nuevo[is.na(t$ind_nuevo)]<-0
t$ind_nomina_ult1[is.na(t$ind_nomina_ult1)]<-0
t$ind_nom_pens_ult1[is.na(t$ind_nom_pens_ult1)]<-0

t$antiguedad<-NULL
t$indrel<-NULL
t$ult_fec_cli_1t<-NULL
t$indrel_1mes<-NULL
t$canal_entrada<-NULL
t$cod_prov<-NULL
t$ind_actividad_cliente<-NULL
t$conyuemp<-NULL
#t$tiprel_1mes<-NULL
#t$segmento<-NULL

for(i in 1:ncol(t)) t[[i]] <- as.factor(t[[i]])
#t<-as.matrix(t)
rules <- apriori(data =t, parameter = list(supp = 0.005, conf = 0.75,minlen=2))

inspect(rules)
SavingAccount<-subset(rules, subset = rhs %in% "ind_ahor_fin_ult1=1")
SavingAccount
Guarantees<-subset(rules, subset = rhs %in% "ind_aval_fin_ult1=1")
Guarantees
CurrentAccounts<-subset(rules, subset = rhs %in% "ind_cco_fin_ult1=1")
CurrentAccounts
DerivadaAccount<-subset(rules, subset = rhs %in% "ind_cder_fin_ult1=1")
DerivadaAccount
PayrollAccount<-subset(rules, subset = rhs %in% "ind_cno_fin_ult1=1")
PayrollAccount
JuniorAccount<-subset(rules, subset = rhs %in% "ind_ctju_fin_ult1=1")
JuniorAccount
MasparticularAccount<-subset(rules, subset = rhs %in% "ind_ctma_fin_ult1=1")
MasparticularAccount
particularAccount<-subset(rules, subset = rhs %in% "ind_ctop_fin_ult1=1")
particularAccount
particularPlusAccount<-subset(rules, subset = rhs %in% "ind_ctpp_fin_ult1=1")
particularPlusAccount
Shorttermdeposits<-subset(rules, subset = rhs %in% "ind_deco_fin_ult1=1")
Shorttermdeposits
Mediumtermdeposits<-subset(rules, subset = rhs %in% "ind_deme_fin_ult1=1")
Mediumtermdeposits
Longtermdeposits<-subset(rules, subset = rhs %in% "ind_dela_fin_ult1=1")
Longtermdeposits
eaccount<-subset(rules, subset = rhs %in% "ind_ecue_fin_ult1=1")
eaccount
Funds<-subset(rules, subset = rhs %in% "ind_fond_fin_ult1=1")
Funds
Mortgage<-subset(rules, subset = rhs %in% "ind_hip_fin_ult1=1")
Mortgage
Pensions<-subset(rules, subset = rhs %in% "ind_plan_fin_ult1=1")
Pensions
Loans<-subset(rules, subset = rhs %in% "ind_pres_fin_ult1=1")
Loans
Taxes<-subset(rules, subset = rhs %in% "ind_reca_fin_ult1=1")
Taxes
CreditCard<-subset(rules, subset = rhs %in% "ind_tjcr_fin_ult1=1")
CreditCard
Securities<-subset(rules, subset = rhs %in% "ind_valo_fin_ult1=1")
Securities
HomeAccount<-subset(rules, subset = rhs %in% "ind_viv_fin_ult1=1")
HomeAccount
Payroll<-subset(rules, subset = rhs %in% "ind_nomina_ult1=1")
Payroll
Pensions<-subset(rules, subset = rhs %in% "ind_nom_pens_ult1=1")
Pensions
DirectDebit<-subset(rules, subset = rhs %in% "ind_recibo_ult1=1")
DirectDebit
rm(t)

#################################################################################
