#plot3.R - Question 1:
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question. 

library(dplyr)
library(ggplot2)

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

qplot(year, Emissions, data = Baltimore, facets = .~type, geom = c("point", "smooth"), method = "lm")



#conclusion: All have decreased over time.