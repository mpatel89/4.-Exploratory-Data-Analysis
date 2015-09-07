#plot2.R - Question 1:
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question. 

library(dplyr)

#Sets working directory
setwd("~/R/Coursera/4. Exploratory Data Analysis/Project-2")

#Looks for data file and downloads if file not found
if(!(file.exists("summarySCC_PM25.rds") & file.exists("Source_Classification_Code.rds")))
{
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "data.zip")
  unzip("data.zip")
}

#Read data files
pm25data <- readRDS("summarySCC_PM25.rds") 

Baltimore <- filter(pm25data, fips == "24510")

#pull sums of yearly emissions
Baltimore <- group_by(Baltimore, year)
sums <- summarize(Baltimore, sum = sum(Emissions))
sums$year<-as.factor(sums$year)

#plot yearly sums
barplot(sums$sum, main = "Yearly Emissions in Baltimore City, Maryland", names.arg=sums$year, xlab = "Year", ylab = "Emissions (in tons)", col = rainbow(4))

#conclusion: Total emissions in Baltimore City have decreased from 1999 to 2008, with some variability.