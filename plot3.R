## Load Data
LoadData <- read.csv("household_power_consumption.txt", sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
LoadData$Date <- as.Date(LoadData$Date, format="%d/%m/%Y")
data <- LoadData[LoadData$Date %in% as.Date(c("2007-02-01" , "2007-02-02")),]
rm(LoadData)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.5)

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
