library(ggplot2)
library(plyr)

foo <- read.delim("~/nsr/outputs/NSRenvirons.pceec.cod.fixed.ooo",header=F,sep=":")


####Give appropriate column names to the columns
colnames(foo) <- c("Sbj","Verb","Adjacent","Agr","ID")


####Throw out all the codes that refer to tokens that are irrelevant for the study.
foo.data <- subset(foo, Sbj != "z" & Verb != "z" & Adjacent != "z" & Sbj != "othersbj" & Agr != "z")

library(gdata)

####Make sure R factor groups don't include factors for the irrelevant codes.
foo.data <- droplevels(foo.data)

foo.table <- table(foo.data$Sbj,foo.data$Adjacent)
fooFreq.table <- foo.table/sum(foo.table)

sg1Adj <- 4986
sg2Adj <- (966+20)*(0.95) #961 vs 25 is Lisa's original adjacent vs non-adjacent split, but to just multiply by the freqs of sing vs plural would assume independence bet/ adjacency and number, which is wrong based on her sample. So I've added them together to re-estimate adjacent and non-adjacent from Lisa's sample-of-you freqs.
sg3Adj <- 1569
pl13Adj <- 643
pl2Adj <- (966+20)*(0.03)
DPsgAdj <- 1810
DPplAdj <- 265
sg1Non <- 66
sg2Non <- (966+20)*(0.01)
sg3Non <- 19
pl13Non <- 19
pl2Non <- (966+20)*(0.01)
DPsgNon <- 1526
DPplNon <- 192

Total <- sg1Adj + sg2Adj + sg3Adj + pl13Adj + pl2Adj + DPsgAdj + DPplAdj + sg1Non + sg2Non + sg3Non + pl13Non + pl2Non + DPsgNon + DPplNon

sg1Adj <- sg1Adj/Total
sg2Adj <- sg2Adj/Total #961 vs 25 is Lisa's original adjacent vs non-adjacent split, but to just multiply by the freqs of sing vs plural would assume independence bet/ adjacency and number, which is wrong based on her sample. So I've added them together to re-estimate adjacent and non-adjacent from Lisa's sample-of-you freqs.
sg3Adj <- sg3Adj/Total
pl13Adj <- pl13Adj/Total
pl2Adj <- pl2Adj/Total
DPsgAdj <- DPsgAdj/Total
DPplAdj <- DPplAdj/Total
sg1Non <- sg1Non/Total
sg2Non <- sg2Non/Total
sg3Non <- sg3Non/Total
pl13Non <- pl13Non/Total
pl2Non <- pl2Non/Total
DPsgNon <- DPsgNon/Total
DPplNon <- DPplNon/Total


#Threeway calculation assuming no t/d-deletion
NSR <- (sg2Adj+sg2Non) + DPplAdj + sg1Non + pl13Non + pl2Non + DPplNon
StE <- sg2Non + sg2Adj
Zero <- sg2Adj+sg2Non + sg3Adj + DPsgAdj + sg3Non + DPsgNon

NSR
StE
Zero

#Threeway calculation assuming t/d-deletion; retention = 0.84 in past tense from guy 1990, = 51% following s from guy and boberg 1997 
NSR <- DPplAdj + sg1Non + pl13Non + pl2Non + DPplNon
StE <- ((sg2Non + sg2Adj)*(0.84*0.51))
Zero <- sg2Adj+sg2Non + sg3Adj + DPsgAdj + sg3Non + DPsgNon

NSR
StE
Zero

#Pairwise calculation assuming no t/d-deletion
NSRwrtStE <- (sg2Adj+sg2Non) + DPplAdj + sg1Non + pl13Non + pl2Non  + DPplNon
NSRwrtZero <- sg2Adj+sg2Non + sg3Adj + DPsgAdj + DPplAdj + sg1Non + sg2Non + sg3Non + pl13Non + pl2Non + DPsgNon + DPplNon
StEwrtNSR <- sg2Non + sg2Adj + DPplAdj +sg1Non + pl13Non + pl2Non  + DPplNon
StEwrtZero <- sg2Non + sg2Adj + sg3Adj + DPsgAdj + sg3Non + DPsgNon
ZeroWrtNSR <- sg2Adj + sg2Non + sg3Adj +DPsgAdj + DPplAdj + sg1Non + sg3Non + pl13Non + pl2Non +  DPsgNon + DPplNon
ZeroWrtStE <- (sg2Non + sg2Adj) + sg3Adj + DPsgAdj + sg3Non + DPsgNon 

"NSRwrtStE"
NSRwrtStE
"StEwrtNSR"
StEwrtNSR
"NSRwrtZero"
NSRwrtZero
"ZeroWrtNSR"
ZeroWrtNSR
"StEwrtZero"
StEwrtZero
"ZeroWrtStE"
ZeroWrtStE

#Pairwise calculation assuming t/d-deletion; note that StE can use td-deletion with 2sg in modals
NSRwrtStE <-  DPplAdj + sg1Non + pl13Non + pl2Non  + DPplNon
NSRwrtZero <- sg2Adj+sg2Non + sg3Adj + DPsgAdj + DPplAdj + sg1Non + sg2Non + sg3Non + pl13Non + pl2Non + DPsgNon + DPplNon
StEwrtNSR <- ((sg2Non + sg2Adj)*(0.82*0.58)) + DPplAdj +sg1Non + pl13Non + pl2Non  + DPplNon
StEwrtZero <- sg2Non + sg2Adj + sg3Adj + DPsgAdj + sg3Non + DPsgNon
ZeroWrtNSR <- sg2Adj + sg2Non + sg3Adj +DPsgAdj + DPplAdj + sg1Non + sg3Non + pl13Non + pl2Non +  DPsgNon + DPplNon
ZeroWrtStE <- (sg2Non + sg2Adj) + sg3Adj + DPsgAdj + sg3Non + DPsgNon 

"NSRwrtStE"
NSRwrtStE
"StEwrtNSR"
StEwrtNSR
"NSRwrtZero"
NSRwrtZero
"ZeroWrtNSR"
ZeroWrtNSR
"StEwrtZero"
StEwrtZero
"ZeroWrtStE"
ZeroWrtStE


modal.table <- table(foo.data$Sbj,foo.data$Verb)

#Advantage with modal and t/d, assuming modals are 40%

sg2AdjV <- 0.6*sg2Adj
sg2AdjMod <- 0.4*sg2Adj
sg2NonV <- 0.6*sg2Non
sg2NonMod <- 0.4*sg2Non

#This may be an exaggeration, since shallt and willt aren't the same as wouldst, couldst, might, mayst, canst
NSRwrtStE <-  DPplAdj + sg1Non + pl13Non + pl2Non  + DPplNon
NSRwrtZero <- sg2AdjV+sg2NonV + sg3Adj + DPsgAdj + DPplAdj + sg1Non + sg2Non + sg3Non + pl13Non + pl2Non + DPsgNon + DPplNon
StEwrtNSR <- ((sg2Non + sg2Adj)*(0.82*0.58)) + DPplAdj +sg1Non + pl13Non + pl2Non  + DPplNon
StEwrtZero <- sg2Non + sg2Adj + sg3Adj + DPsgAdj + sg3Non + DPsgNon
ZeroWrtNSR <- sg2AdjV + sg2NonV + sg3Adj +DPsgAdj + DPplAdj + sg1Non + sg3Non + pl13Non + pl2Non +  DPsgNon + DPplNon
ZeroWrtStE <- sg2AdjV + sg2NonV + sg3Adj + DPsgAdj + sg3Non + DPsgNon 

"NSRwrtStE"
NSRwrtStE
"StEwrtNSR"
StEwrtNSR
"NSRwrtZero"
NSRwrtZero
"ZeroWrtNSR"
ZeroWrtNSR
"StEwrtZero"
StEwrtZero
"ZeroWrtStE"
ZeroWrtStE