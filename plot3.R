png(file="plot3.png", width=480, heigh=480)

library(readr)

file <- "household_power_consumption.txt"
power <- read_csv2(file=file)
power <- power[66638:69518,]
power <- power[complete.cases(power),]
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
power$Date <- as.Date(power$Date, format=("%d/%m/%Y"))
power$Date <- format(power$Date, "%Y/%m/%d")
pdatetime <- paste(power$Date, power$Time)
pdatetime <- as.POSIXct(pdatetime)
plot(pdatetime, power$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(pdatetime, power$Sub_metering_2, type="l", col="red")
lines(pdatetime, power$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)
dev.off()


