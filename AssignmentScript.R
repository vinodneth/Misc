## Project 2 - reproducable research
## libraries required
library(dplyr)

## load data from file
setwd("C:/Users/User/Coursera/Cs5Wk4")
storm<-read.csv("StormData.csv.bz2")

## Reduce columns to what is required for the analysis
keepCol <- c("BGN_DATE", "EVTYPE", "FATALITIES", "INJURIES", "PROPDMG", "PROPDMGEXP", "CROPDMG", "CROPDMGEXP")
reducedStormData <- storm[, keepCol]

## Append column to capture the year
reducedStormData$year <- as.numeric(format(as.Date(reducedStormData$BGN_DATE, format = "%m/%d/%Y %H:%M:%S"), "%Y"))
hist(reducedStormData$year, breaks = 30)

## Trim data to keep later years which has more meaningful data. 
quant25percent <-quantile(reducedStormData$year, 0.25)
rStorm <- reducedStormData[reducedStormData$year >= quant25percent, ]
dim(rStorm)

## Identifying the most harmful events for US

## Identify by Fatality


## Identify by Injuries
