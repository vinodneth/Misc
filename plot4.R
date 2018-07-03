## Plot 4 -

## Load data - filtered and formatted (if null)
source("load_data.R")
if (is.null(data)) {
  data<-load_data()
}

## plot Hist
library(datasets)
par(mfrow=c(2,2))

##Frame 1
plot(data$timestamp,data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##Frame 2
plot(data$timestamp,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

##Frame 3
plot(data$timestamp,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$timestamp,data$Sub_metering_2,col="red")
lines(data$timestamp,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

#Frame 4
plot(data$timestamp,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
