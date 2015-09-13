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
SCC <- readRDS("Source_Classification_Code.rds") 

a <- grepl("Vehicles", SCC$SCC.Level.Two)
combCoal <- SCC[a,]
index <- combCoal$SCC
index <- as.character(index)

x <- pm25data[pm25data$SCC %in% index,]

Baltimore <- filter(x, fips == "24510")

Baltimore <- Baltimore[Baltimore$Emissions>0,]
Baltimore <- group_by(Baltimore, year)
sumsBaltimore <- summarize(Baltimore, sum = sum(Emissions))
sumsBaltimore$year<-as.factor(sumsBaltimore$year)
sumsBaltimore <- mutate(sumsBaltimore,City = as.factor(rep("Baltimore",4)))

LA <- filter(x, fips == "06037")

LA <- LA[LA$Emissions>0,]
LA <- group_by(LA, year)
sumsLA <- summarize(LA, sum = sum(Emissions))
sumsLA$year<-as.factor(sumsLA$year)
sumsLA <- mutate(sumsLA,City = as.factor(rep("LA",4)))

sums <- rbind(sumsBaltimore, sumsLA)

#plot yearly sums
qplot(year, sum, data = sums, facets = .~City)

