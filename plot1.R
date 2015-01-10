#!/usr/bin/env Rscript

rm(list = ls())
source("utils.R")

tbl <- prepareAndLoadData()
png(filename = "plot1.png", width = 480, height = 480)
hist(tbl$Global_active_power, col="Red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
