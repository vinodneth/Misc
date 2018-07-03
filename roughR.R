setwd("C:/Users/User/Coursera/Cs5Wk4")
storm<-read.csv("StormData.csv.bz2")
tmpagr<-aggregate(storm$INJURIES,by=list(EventType=storm$EVTYPE),FUN=sum)
library(plyr)
arrange(tmpagr,desc(x))

numValue <-function (number, expr) {
  multi = 1
  
  if (expr == "k") 
  {multi = 1000} 
  else if( expr == "M" || expr == "m") {
    multi = 1000000
  }
  numValue= number * multi
  return(numValue)
}


storm2<-mutate(storm,PROPDMGVAL=numValue(PROPDMG,PROPDMGEXP))

## https://rpubs.com/gracecao/119656 - preferred!
## https://rpubs.com/cbradbury/repres-peerassessment2
## https://github.com/TomLous/coursera-reproducible-research-peer-assessment2/blob/master/stormDataAnalysis.Rmd

## rpubs http://rpubs.com/vinodnet/296343
