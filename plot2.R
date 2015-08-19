#plot1.R
setwd("~/R/Coursera/4. Exploratory Data Analysis/4.-Exploratory-Data-Analysis")

#set classes for columns; mainly for dates as characters
colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

#read header and data with proper head names and select rows
colNamesVec <- as.character(read.table("household_power_consumption.txt", sep = ";", colClasses = "character", nrows = 1))
x <- read.table("household_power_consumption.txt", sep = ";", col.names=colNamesVec, colClasses = colClasses, skip =66637, nrows = 2881)

#change Date and Times to respective formats.
x[[1]] <- as.Date(x[[1]], format="%d/%m/%Y")

#Generate labeled histogram for Global Active Power frequency
plot(x$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
  
    # TODO: get x-axis labels to show days without changing data....