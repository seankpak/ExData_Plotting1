png(file="plot4.png", width=480, heigh=480)

library(readr)

file <- "household_power_consumption.txt"
power <- read_csv2(file=file)
power <- power[66638:69518,]
power <- power[complete.cases(power),]
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
vol <- power$Voltage/1000
power$Date <- as.Date(power$Date, format=("%d/%m/%Y"))
power$Date <- format(power$Date, "%Y/%m/%d")
pdatetime <- paste(power$Date, power$Time)
pdatetime <- as.POSIXct(pdatetime)

par(mfrow=c(2,2))

plot(pdatetime, power$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(pdatetime, vol, type="l", ylab="Voltage", xlab="datetime")
plot(pdatetime, power$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(pdatetime, power$Sub_metering_2, type="l", col="red")
lines(pdatetime, power$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, bty="n")
plot(pdatetime, power$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()

