## Plot 1 - Hist 

## Load data - filtered and formatted
source("load_data.R")
data<-load_data()

## plot Hist
library(datasets)
hist(data$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()