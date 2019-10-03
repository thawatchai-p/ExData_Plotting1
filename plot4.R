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
Plot4_1 <- data.frame(DateTime, data$Global.Active.Power)
Plot4_2 <- data.frame(DateTime, data$Sub.Metering.1, data$Sub.Metering.2, data$Sub.Metering.3)
Plot4_3 <- data.frame(DateTime, data$Voltage)
Plot4_4 <- data.frame(DateTime, data$Global.Reactive.Power)

## Create plot3 on screen device
par(mfcol = c(2, 2),  mar = c(4,4,3,2)+0.1)
with(Plot4_1, plot(DateTime, data.Global.Active.Power, type = "l", xlab = "", 
                 ylab = "Global Active Power"))     # Plot4_1

with(Plot4_2, plot(DateTime, data.Sub.Metering.1, type = "l", xlab = "", ylab = ""))
with(Plot4_2, points(DateTime, data.Sub.Metering.2, type = "l", xlab = "", ylab = "", col = "red"))
with(Plot4_2, points(DateTime, data.Sub.Metering.3, type = "l", xlab = "", ylab = "", col = "blue"))
title(ylab = "Energy sub metering")
legend("topright", bty = "n", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.6) # Plot4_2

with(Plot4_3, plot(DateTime, data.Voltage, type = "l", xlab = "datetime", 
                   ylab = "Voltage"))     # Plot4_3

with(Plot4_4, plot(DateTime, data.Global.Reactive.Power, type = "l", xlab = "datetime", 
                   ylab = "Global_reactive_power"))     # Plot4_4

## Copy plot4 to a PNG file
dev.copy(png, file = "plot4.png")
dev.off()
