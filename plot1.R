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

png(filename = "plot1.png", width = 480, height = 480)
hist(tbl$Global_active_power, col="Red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
