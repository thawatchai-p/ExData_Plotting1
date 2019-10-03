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
                   skip = 66637, nrows = 2881, 
                   col.names = c("Date", "Time", "Global Active Power", 
                                 "Global Reactive Power", "Voltage", "Global Intensity", 
                                 "Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

##Convert Date and Time format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
DateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Plot2 <- data.frame(DateTime, data$Global.Active.Power)

## Create plot2 on screen device
with(Plot2, plot(DateTime, data.Global.Active.Power, type = "l", xlab = "", 
                    ylab = "Global Active Power (kilowatts)"))

## Copy plot2 to a PNG file
dev.copy(png, file = "plot2.png")
dev.off()
