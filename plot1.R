#plot1.R
#set classes for columns; mainly for dates as characters
colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

#read header and data with proper head names and select rows
colNamesVec <- as.character(read.table("household_power_consumption.txt", sep = ";", colClasses = "character", nrows = 1))
x <- read.table("household_power_consumption.txt", sep = ";", col.names=colNamesVec, colClasses = colClasses, skip =66636, nrows = 2880)

#change Date and Times to respective formats.
# as.Date(x[[1]][1], format="%d/%m/%Y")