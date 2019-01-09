library(data.table)
library(arules1)
cols <- c('ind_ahor_fin_ult1','ind_aval_fin_ult1','ind_cco_fin_ult1','ind_cder_fin_ult1','ind_cno_fin_ult1','ind_ctju_fin_ult1','ind_ctma_fin_ult1','ind_ctop_fin_ult1',
          'ind_ctpp_fin_ult1',
          'ind_deco_fin_ult1',
          'ind_deme_fin_ult1',
          'ind_dela_fin_ult1',
          'ind_ecue_fin_ult1',
          'ind_fond_fin_ult1',
          'ind_hip_fin_ult1', 
          'ind_plan_fin_ult1',
          'ind_pres_fin_ult1',
          'ind_reca_fin_ult1',
          'ind_tjcr_fin_ult1',
          'ind_valo_fin_ult1',
          'ind_viv_fin_ult1', 
          'ind_nomina_ult1', 
          'ind_nom_pens_ult1',
          'ind_recibo_ult1')
trainN <- as.matrix(fread('/home/shreyas/sta proj/train_ver2.csv',
                         select=cols,
                         showProgress=FALSE,
                         nrows = 5000000))

trainN[is.na(trainN[,22]),22] <- 0
trainN[is.na(trainN[,23]),23] <- 0
rules1 <- apriori(data = trainN, parameter = list(supp = 0.005, conf = 0.75))
inspect(rules1)

SavingAccount1<-subset(rules1, subset = rhs %in% "ind_ahor_fin_ult1")
SavingAccount1
Guarantees1<-subset(rules1, subset = rhs %in% "ind_aval_fin_ult1")
Guarantees1
CurrentAccounts1<-subset(rules1, subset = rhs %in% "ind_cco_fin_ult1")
CurrentAccounts1
DerivadaAccount1<-subset(rules1, subset = rhs %in% "ind_cder_fin_ult1")
DerivadaAccount1
PayrollAccount1<-subset(rules1, subset = rhs %in% "ind_cno_fin_ult1")
PayrollAccount1
JuniorAccount1<-subset(rules1, subset = rhs %in% "ind_ctju_fin_ult1")
JuniorAccount1
MasparticularAccount1<-subset(rules1, subset = rhs %in% "ind_ctma_fin_ult1")
MasparticularAccount1
particularAccount1<-subset(rules1, subset = rhs %in% "ind_ctop_fin_ult1")
particularAccount1
particularPlusAccount1<-subset(rules1, subset = rhs %in% "ind_ctpp_fin_ult1")
particularPlusAccount1
Shorttermdeposits1<-subset(rules1, subset = rhs %in% "ind_deco_fin_ult1")
Shorttermdeposits1
Mediumtermdeposits1<-subset(rules1, subset = rhs %in% "ind_deme_fin_ult1")
Mediumtermdeposits1
Longtermdeposits1<-subset(rules1, subset = rhs %in% "ind_dela_fin_ult1")
Longtermdeposits1
eaccount1<-subset(rules1, subset = rhs %in% "ind_ecue_fin_ult1")
eaccount1
Funds1<-subset(rules1, subset = rhs %in% "ind_fond_fin_ult1")
Funds1
Mortgage1<-subset(rules1, subset = rhs %in% "ind_hip_fin_ult1")
Mortgage1
Pensions1<-subset(rules1, subset = rhs %in% "ind_plan_fin_ult1")
Pensions1
Loans1<-subset(rules1, subset = rhs %in% "ind_pres_fin_ult1")
Loans1
Taxes1<-subset(rules1, subset = rhs %in% "ind_reca_fin_ult1")
Taxes1
CreditCard1<-subset(rules1, subset = rhs %in% "ind_tjcr_fin_ult1")
CreditCard1
Securities1<-subset(rules1, subset = rhs %in% "ind_valo_fin_ult1")
Securities1
HomeAccount1<-subset(rules1, subset = rhs %in% "ind_viv_fin_ult1")
HomeAccount1
Payroll1<-subset(rules1, subset = rhs %in% "ind_nomina_ult1")
Payroll1
Pensions1<-subset(rules1, subset = rhs %in% "ind_nom_pens_ult1")
Pensions1
DirectDebit1<-subset(rules1, subset = rhs %in% "ind_recibo_ult1")
DirectDebit1

