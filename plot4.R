#!/usr/bin/env Rscript

rm(list = ls())

## read & massage data

subset.file <- "subset.Rd"

if (file.exists(subset.file)) {
    load(subset.file)
} else {
    tbl <- read.csv("household_power_consumption.txt",
                    sep=";", na.strings="?")
    tbl <- subset(tbl, Date=="1/2/2007" | Date=="2/2/2007")
    tbl$Time <- strptime(paste(tbl$Date, tbl$Time), "%d/%m/%Y %H:%M:%S")
    tbl$Date <- NULL
    save(tbl, file=subset.file)
}


## generate plot

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(tbl$Time, tbl$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

plot(tbl$Time, tbl$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

plot(tbl$Time, tbl$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(tbl$Time, tbl$Sub_metering_2, col="red")
lines(tbl$Time, tbl$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(tbl$Time, tbl$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")
