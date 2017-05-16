setwd('~/git/Dataiku_test')

library(dplyr)
library(sqldf)
library(ggplot2)
library(reshape2)
library(gridExtra)

train_df <- read.csv('./ressources/us_census_full/census_income_learn.csv')
test_df <- read.csv('./ressources/us_census_full/census_income_test.csv')
names(train_df) <- c("AAGE", "ACLSWKR", "ADTIND", "ADTOCC", "AHGA", "AHRSPAY"
                     , "AHSCOL", "AMARITL", "AMJIND", "AMJOCC", "ARACE", "AREORGN",
                     "ASEX", "AUNMEN", "AUNTYPE", "AWKSTAT", "CAPGAIN", "CAPLOSS",
                      "DIVVAL", "FEDTAX", "FILESTAT", "GRINREG", "GRINST", "HHDFMX",
                      "HHDREL", "MIGMTR1", "MIGMTR3", "MIGMTR4", "MIGSAME", "MIGSUN",
                      "NOEMP", "PARENT", "PEFNTVTY", "PEMNTVTY", "PENATVTY", "PRCITSHP",
                      "SEOTR", "VETQVA", "VETYN", "WKSWORK", "YEAR", "INCOME")
write.csv(train_df, file = './ressources/us_census_full/train.csv')
summary(train_df)
##So we found missing data in GRINREG, MIGMTR1, MIGMTR3, MIGMTR4, MIGSUN, PEFNTVTY, PEMNTVTY,
## TENATVTY

#######Explore Categorical data
train <- train_df
train$INCOME<-ifelse(train$INCOME==train_df$INCOME[1],0,1)
#ACLSWKR
train$ACLSWKR<-ifelse(train$ACLSWKR=='?','Unknown',as.character(train$ACLSWKR))
Work_class<-sqldf('SELECT ACLSWKR, count(ACLSWKR) as Count 
                  ,sum(INCOME) as Above from train group by ACLSWKR')
table<-data.frame(Class=Work_class$ACLSWKR, Proportion=Work_class$Above/Work_class$Count)
Work_class$Below<-Work_class$Count-Work_class$Above
Work_class<-Work_class[,c(1,3,4)]
Workclass<-melt(Work_class,id.vars = 'ACLSWKR')
gg<-ggplot(Workclass,aes(x=ACLSWKR,y=value,fill=variable))+geom_bar(stat = 'identity',position = 'stack')+theme_bw()+scale_fill_manual(values = c('red','green'))+theme(axis.text.x = element_text(angle = 45, hjust = 1))+ggtitle('Proportions of above-paid within different classes')
tbl <- tableGrob(t(table), rows=NULL)
grid.arrange(termTable, gg,nrow=2,as.table=TRUE,heights=c(1,4))
#####we found a error, there's one record "Without pay" but INCOME == 50000+

#ADTIND
train$ADTIND<-ifelse(train$ADTIND=='?','Unknown',as.character(train$ADTIND))
Work_class<-sqldf('SELECT ADTIND, count(ADTIND) as Count 
                  ,sum(INCOME) as Above from train group by ADTIND')
table<-data.frame(Class=Work_class$ADTIND, Proportion=Work_class$Above/Work_class$Count)
Work_class$Below<-Work_class$Count-Work_class$Above
Work_class<-Work_class[,c(1,3,4)]
Workclass<-melt(Work_class,id.vars = 'ADTIND')
gg<-ggplot(Workclass,aes(x=ADTIND,y=value,fill=variable))+geom_bar(stat = 'identity',position = 'stack')+theme_bw()+scale_fill_manual(values = c('red','green'))+theme(axis.text.x = element_text(angle = 45, hjust = 1))+ggtitle('Proportions of above-paid within different industry')
tbl <- tableGrob(t(table), rows=NULL)
grid.arrange(termTable, gg,nrow=2,as.table=TRUE,heights=c(1,4))
#GRINREG, MIGMTR1, MIGMTR3, MIGMTR4, MIGSUN, PEFNTVTY, PEMNTVTY,
## TENATVTY

#GRINREG
train$GRINREG<-ifelse(train$GRINREG=='?','Unknown',as.character(train$GRINREG))
Work_class<-sqldf('SELECT GRINREG, count(GRINREG) as Count 
                  ,sum(INCOME) as Above from train group by GRINREG')
table<-data.frame(Class=Work_class$GRINREG, Proportion=Work_class$Above/Work_class$Count)
Work_class$Below<-Work_class$Count-Work_class$Above
Work_class<-Work_class[,c(1,3,4)]
Workclass<-melt(Work_class,id.vars = 'GRINREG')
gg<-ggplot(Workclass,aes(x=GRINREG,y=value,fill=variable))+geom_bar(stat = 'identity',position = 'stack')+theme_bw()+scale_fill_manual(values = c('red','green'))+theme(axis.text.x = element_text(angle = 45, hjust = 1))+ggtitle('Proportions of above-paid within different GRINREG')
tbl <- tableGrob(t(table), rows=NULL)
grid.arrange(termTable, gg,nrow=2,as.table=TRUE,heights=c(1,4))


####Explore Contineous Variable
#CAPLOSS
gg<-qplot(CAPLOSS, data=train, geom="histogram")+theme_bw()+ggtitle('Histogram of Capital Loss')
gg
