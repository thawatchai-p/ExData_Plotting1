setwd("D:/Coursera/Data Science - Specialization (by Johns Hopkins University)/4-Exploratory Data Analysis/Course Project 1")
library(dplyr)
library(ggplot2)

## Download file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./electric power consumption.zip")
unzip(zipfile = "./electric power consumption.zip")
list.files()

## Read data
data <- read.table(file = "household_power_consumption.txt", header = FALSE, sep = ";", 
                   skip = 66637, nrows = 2880, 
                   col.names = c("Date", "Time", "Global Active Power", 
                                 "Global Reactive Power", "Voltage", "Global Intensity", 
                                 "Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

## Create plot1 on screen device
hist(data$Global.Active.Power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

## Copy plot1 to a PNG file
dev.copy(png, file = "plot1.png")
dev.off()
