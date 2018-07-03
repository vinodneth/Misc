## read data
act<-read.csv("activity.csv",stringsAsFactors = FALSE)
## convert to date format
act$date<-as.Date(act$date,"%Y-%m-%d")
## trim NA values
act1<-act[!is.na(act$steps),]
## get sum by days
cntact1<-aggregate(steps~date,act1,sum)
## barplot of steps made on each date
barplot(cntact1$steps,names.arg = cntact1$date)
## mean steps per day
meanact1<-aggregate(.~date,act1,mean)
## median steps per day
medact1<-aggregate(.~date,act1,median)
## timeseries data for average
timeavgact1<-aggregate(.~interval,act1,mean)
## plot of the time series
plot(timeavgact1$interval,timeavgact1$steps, main = "Time series plot of average steps taken")
## finding the highest 5 min average - get the index and then find the time interval
timeavgact1$interval[which.max(timeavgact1$steps)]
## filing missing data
library(Hmisc)
actfit<-act
actfit$steps<-impute(act$steps, fun=mean)
## counting NAs to confirm they are all filled
length(which(is.na(actfit$steps)))


## urls to refer
## https://github.com/gabrielverta/reproducible-research-assignment-1/blob/master/PA1_template.Rmd
## https://github.com/TomLous/coursera-reproducible-research-peer-assessment1/blob/master/PA1_template.Rmd
## https://github.com/sefakilic/coursera-repdata/blob/master/project1/PA1_template.Rmd

