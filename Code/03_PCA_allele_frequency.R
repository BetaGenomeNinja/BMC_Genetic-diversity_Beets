setwd('/Volumes/UNTITLED/Projects/GSS/R/Global/')

X<-read.table('ALL.allele.freq1',sep=' ')
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

par(mfrow=c(3,3))
mar=c(0,0,0,0)
mar=c(0,0,0,0)

for (i in c('Chr1_EL10_PGA_scaffold3','Chr2_EL10_PGA_scaffold6','Chr3_EL10_PGA_scaffold7',
            'Chr4_EL10_PGA_scaffold1',
            'Chr5_EL10_PGA_scaffold2','Chr6_EL10_PGA_scaffold0',
            'Chr7_EL10_PGA_scaffold5',
            'Chr8_EL10_PGA_scaffold4','Chr9_EL10_PGA_scaffold8')){

X2<-X1[X1[,1]==i,]
X2<-X2[,c("C86925","EL50","EL51","GP10","GP9","L19","SP7322","SR102","SR98","BBTB","Crosby","DDRT","RQ","TGSC","WT",
          "MAM","WGF","LUC","RHU","FGSC","Vulcan")]

# color coding for each breed
cols<-c(rep("blue",9),rep("red",6),rep
        ("yellow",2),rep
        ("green",4))

SVD<-svd(X2)


plot(SVD$v[,2],-1*SVD$v[,1],cex.main=1,main=i
      ,xlab="PC1",ylab="PC2",col=cols,pch=19,cex=3)

NamePoints<-cbind(SVD$v[,2],-1*SVD$v[,1])
row.names(NamePoints)<-(c("C86925","EL50","EL51","GP10","GP9","L19","SP7322","SR102","SR98","BBTB","Crosby","DDRT","RQ","TGSC","WT",
                          "MAM","WGF","LUC","RHU","FGSC","Vulcan"))

for (l in rownames(NamePoints)){
  text(x=NamePoints[l,1],y=NamePoints[l,2],l,cex=1)
}


