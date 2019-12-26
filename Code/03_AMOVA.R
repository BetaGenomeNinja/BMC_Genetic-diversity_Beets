#install.packages('ade4')
library('ade4')
X<-read.table('ALL.allel.freq1')
head(X)
headcol<- c(1,2,5,8,11,14,17,20,23,26,29,32,35,38,41,44,47,50,53,56,59,62,65,68,71)
#X<-X[,headcol]

coln<-c("chr","pos","BBTB","C86925","C869","Crosby","DDRT","EL50","EL51",
        "FGSC","GP10","GP9","L19","LUC","MAM","RHU","RQ","SP7322","SR102",
        "SR98","TGSC","Vulcan","W357B","WGF","WT")

S<-seq(5,71,3)
X1<-X[,S]
X1<-cbind(X[,c(1,2)],X1)
colnames(X1)<-coln
head(X1)
X2<-X1[,c(-5,-23)]
head(X2)

######Filter##########
RowNamesGreaterthan1<-''
for (i in seq(3,23)){
  RowNamesGreaterthan1<-c(RowNamesGreaterthan1,as.character(rownames(na.omit(X2[X2[,i] > 1,]))))
}
RowNamesGreaterthan1<-as.numeric((unique(RowNamesGreaterthan1)))
RowNamesGreaterthan1
RowNamesGreaterthan1<-rownames(X2)[!rownames(X2)%in%RowNamesGreaterthan1]
X2<-X1[RowNamesGreaterthan1,]
length(X2[,1])

########
#Check
rownames(na.omit(X2[X2[,7] > 1,]))
################


SUGAR<-X3[,c("C869","C86925","L19","EL50","EL51","SR98","SP7322","GP9","SR102","GP10")]
#RED<-X2[,c("BBTB","Crosby","DDRT","RQ")]
Table<-X3[,c("W357B","BBTB","TGSC","RQ","WT","DDRT","Crosby")]
FODDER<-X3[,c("WGF","MAM")]
LEAF<-X3[,c("Vulcan","RHU","FGSC","LUC")]

head(SUGAR)
hist(as.matrix(Table))
hist(as.matrix(X3))

XTot<-data.frame()

for (l in c('Chr1_EL10_PGA_scaffold3',  
           'Chr3_EL10_PGA_scaffold7',  
           'Chr5_EL10_PGA_scaffold2',  
           'Chr7_EL10_PGA_scaffold5',  
           'Chr9_EL10_PGA_scaffold8',
           'Chr2_EL10_PGA_scaffold6',  
           'Chr4_EL10_PGA_scaffold1',  
           'Chr6_EL10_PGA_scaffold0',  
           'Chr8_EL10_PGA_scaffold4')){

Xlo<-X2[X2[,1]==l,]
XTo<-data.frame(seq(1,110))
for (i in seq(3,25)){
  LOS<-loess.smooth(Xlo$pos,Xlo[,i],
                  evaluation = 110,digits=0,
                  span = 1/100,digits=1,
                  family = c("symmetric", "gaussian"))
  XTo<-cbind(XTo,LOS$y)
}
XTot<-rbind(XTot,cbind(rep(l,110),LOS$x,XTo))
}

X3<-XTot[,c(-1,-2,-3)]
XA1<-X3
XA2<-dist(X3,method="euclidean")
XS<-data.frame()
XS<-cbind(c('Table','Sugar','Sugar','Table','Table','Sugar','Sugar','Leaf','Sugar','Sugar','Sugar','Leaf','Fodder','Leaf',
      'Table','Sugar','Sugar','Sugar','Table','Leaf','Table','Fodder','Table'))
colnames(XS)<-c('CROP')
XS<-data.frame(XS)
amova(XA1,XA2,XS)

