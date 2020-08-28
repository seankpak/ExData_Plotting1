png(file="plot2.png", width=480, heigh=480)

library(readr)

file <- "household_power_consumption.txt"
power <- read_csv2(file=file)
power <- power[66638:69518,]
power <- power[complete.cases(power),]
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Date <- as.Date(power$Date, format=("%d/%m/%Y"))
power$Date <- format(power$Date, "%Y/%m/%d")
pdatetime <- paste(power$Date, power$Time)
pdatetime <- as.POSIXct(pdatetime)
plot(pdatetime, power$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()


