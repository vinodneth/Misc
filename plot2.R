## Plot 2 - plot 

## Load data - filtered and formatted (if null)
source("load_data.R")
if (is.null(data)) {
data<-load_data()
}

## plot Hist
library(datasets)
plot(data$timestamp,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()