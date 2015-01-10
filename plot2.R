#!/usr/bin/env Rscript

rm(list = ls())
source("utils.R")

tbl <- prepareAndLoadData()
png(filename = "plot2.png", width = 480, height = 480)
plot(tbl$Time, tbl$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
