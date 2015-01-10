## Utility functions for the project

## Load subset of data (download and prepare if needed)

prepareAndLoadData <- function() {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

    local.file <- "data.zip"
    data.file <- "household_power_consumption.txt"
    subset.file <- "subset.Rd"

    if (file.exists(subset.file)) {     # already prepared subset
        load(subset.file)
        return(tbl)
    }

    if (!file.exists(data.file)) {      # must download CSV
        message("Downloading data")
        download.file(url, local.file, method="curl")
        unzip(local.file)
    }

    message("Loading CSV file")
    tbl <- read.csv(data.file, sep=";", na.strings="?")
    tbl <- subset(tbl, Date=="1/2/2007" | Date=="2/2/2007")
    tbl$Time <- strptime(paste(tbl$Date, tbl$Time), "%d/%m/%Y %H:%M:%S")
    tbl$Date <- NULL
    save(tbl, file=subset.file)
    return(tbl)
}
