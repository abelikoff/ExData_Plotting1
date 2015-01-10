#!/usr/bin/env Rscript

rm(list = ls())
source("utils.R")

tbl <- prepareAndLoadData()
png(filename = "plot3.png", width = 480, height = 480)
plot(tbl$Time, tbl$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(tbl$Time, tbl$Sub_metering_2, col="red")
lines(tbl$Time, tbl$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
