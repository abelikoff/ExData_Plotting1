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

png(filename = "plot3.png", width = 480, height = 480)
plot(tbl$Time, tbl$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(tbl$Time, tbl$Sub_metering_2, col="red")
lines(tbl$Time, tbl$Sub_metering_3, col="blue")
legend(x=100,y=100,c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       cex=.8,
       col=c("black", "red", "blue"), pch=c(1,3, 5))
