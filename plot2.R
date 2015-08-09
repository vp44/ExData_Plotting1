## Load Data
LoadData <- read.csv("household_power_consumption.txt", sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
LoadData$Date <- as.Date(LoadData$Date, format="%d/%m/%Y")
data <- LoadData[LoadData$Date %in% as.Date(c("2007-02-01" , "2007-02-02")),]
rm(LoadData)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
