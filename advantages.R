library(ggplot2)
library(plyr)

foo <- read.delim("~/constantentropy/outputs/infoTheoryTest.ymeb.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns
colnames(foo) <- c("OV","Clause","ObjType","SbjType","ID","Year")


####Throw out all the codes that refer to tokens that are irrelevant for the study.
objsbj.data <- subset(foo, OV != "z" & Clause != "z" & Year != "0" & Year != "" & Year != "na" & SbjType != "z" & SbjType != "" & ObjType != "z" & ObjType != "" & ID != "")

library(gdata)

####Make sure R factor groups don't include factors for the irrelevant codes.
objsbj.data <- droplevels(objsbj.data)

sg1Adj <- 0
sg2Adj <- 0
sg3Adj <- 0
pl1Adj <- 0
pl2Adj <- 0
pl3Adj <- 0
DPsgAdj <- 0
DPplAdj <- 0
sg1Non <- 0
sg2Non <- 0
sg3Non <- 0
pl1Non <- 0
pl2Non <- 0
pl3Non <- 0
DPsgNon <- 0
DPplNon <- 0

#Threeway calculation assuming no t/d-deletion
NSR <- (sg2Adj+sg2Non) + DPplAdj + sg1Non + pl1Non + pl2Non + pl3Non + DPplNon
StE <- sg2Non + sg2Adj
Zero <- sg2Adj+sg2Non + sg3Adj + DPsgAdj + sg3Non + DPsgNon
#Threeway calculation assuming t/d-deletion
NSR <- DPplAdj + sg1Non + pl1Non + pl2Non + pl3Non + DPplNon
StE <- sg2Non + sg2Adj
Zero <- sg2Adj+sg2Non + sg3Adj + DPsgAdj + sg3Non + DPsgNon

#Pairwise calculation assuming no t/d-deletion
NSRwrtStE <- (sg2Adj+sg2Non) + DPplAdj + sg1Non + pl1Non + pl2Non + pl3Non + DPplNon
NSRwrtZero <- sg2Adj+sg2Non + sg3Adj + DPsgAdj + DPplAdj + sg1Non + sg2Non + sg3Non + pl1Non + pl2Non + pl3Non + DPplNon
StEwrtNSR <- sg2Non + sg2Adj + DPplAdj +sg1Non + pl1Non + pl2Non + pl3Non + DPplNon
StEwrtZero <- sg2Non + sg2Adj + sg3Adj + DPsgAdj + sg3Non + DPsgNon
ZeroWrtNSR <- sg2Adj + sg2Non + sg3Adj +DPsgAdj + DPplAdj + sg1Non + sg3Non + pl1Non + pl2Non + pl3Non + DPsgNon + DPplNon
ZeroWrtStE <- (sg2Non + sg2Adj) + sg3Adj + DPsgAdj + DPsgNon + sg1Non + sg3Non + DPsgNon 
#Pairwise calculation assuming t/d-deletion; note that Zero can use td-deletion in modals