#plot1.R

#sets working directory
setwd("~/R/Coursera/4. Exploratory Data Analysis")

#looks for data file or downloads if file not found
if(!file.exists("household_power_consumption.txt"))
{
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
  unzip("data.zip")
}

#We want to select for Feb. 1st through Feb 2nd.The data starts on Dec. 16 of the previous year, so there are 46 days worth of reads to skip.
#Also, to address the time of the start (6 hours, 36 minutes), which is 396 reads. 
#That's 46 days * 24 hours * 60 minutes + 396 reads= 66636. This is how many we want to skip.
#We want to go from 0:00:00 hour to 0:00:00 hour of Feb 3rd (bc the plots have Friday on them; we'll need that). That is 2881 reads for each minute.

#read header and desired subset of data with proper head names
colNamesVec <- as.character(read.table("household_power_consumption.txt", sep = ";", colClasses = "character", nrows = 1))
x <- read.table("household_power_consumption.txt", sep = ";", col.names=colNamesVec, skip =66637, nrows = 2881)

#Generate labeled histogram for Global Active Power frequencyand output figure to PNG file
png("plot1.png")
hist(x$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
