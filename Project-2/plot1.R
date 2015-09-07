#plot1.R - Question 1:
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission from
#all sources for each of the years 1999, 2002, 2005, and 2008. 

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

#pull sums of yearly emissions
pm25data <- group_by(pm25data, year)
sums <- summarize(pm25data, sum = sum(Emissions))
sums$year<-as.factor(sums$year)

#plot yearly sums
barplot(sums$sum, main = "Yearly Emissions", names.arg=sums$year, xlab = "Year", ylab = "Emissions (in tons)", col = rainbow(4))

#conclusion: Total emissions have decreased from 1999 to 2008.