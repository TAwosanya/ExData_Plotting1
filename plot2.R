timeStamp <- seq.POSIXt(strptime("16/12/2006 17:24:00", format="%d/%m/%Y %H:%M:%S"), strptime("26/11/2010 21:02:00", format="%d/%m/%Y %H:%M:%S"), "min")
startDateTimeIndex <- which(timeStamp==strptime("01/02/2007", format="%d/%m/%Y"))
endDateTimeIndex <- which(timeStamp==strptime("02/02/2007 23:59:00", format="%d/%m/%Y %H:%M:%S"))
skip <- startDateTimeIndex
nrows <- endDateTimeIndex - startDateTimeIndex
tempData <- read.csv2("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, nrows=1)
myData <- read.csv2("./exdata-data-household_power_consumption/household_power_consumption.txt", header=FALSE, nrows=nrows, skip=skip)
names(myData) <- names(tempData)

myData$TimeStamp <- strptime(paste(myData[,1],myData[,2]), format="%d/%m/%Y %H:%M:%S")
myData[,3:9] <- apply(myData[,3:9],2, as.numeric)

png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(myData, plot(TimeStamp, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()

