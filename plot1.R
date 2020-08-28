png(file="plot1.png", width=480, heigh=480)

library(readr)

file <- "household_power_consumption.txt"
power <- read_csv2(file=file)
power <- power[66638:69518,]
power$Global_active_power <- as.numeric(power$Global_active_power)
hist(power$Global_active_power, col = "red",main="Global Active Power", xlab="Gloabl Active Power (kilowatts)")

dev.off()


