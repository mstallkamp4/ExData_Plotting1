#   Exploratory Data Analysis - Peer Graded Assignment 1
#
#   Created By: Mike Stallkamp
#   Created On: 4/2/2017
#   
#   Question Number 2

#Import Libraries that are needed
library(dplyr)
library(lubridate)

#Read Data
pwr<-read.csv(".\\data\\household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)


#Limit to only 2/1/07 and 2/2/07
subpwr<-pwr[pwr$Date=='1/2/2007' | pwr$Date=='2/2/2007', ]

#Read.csv imported my data with bad data types
#Convert to correct data type
subpwr$Date = dmy(subpwr$Date)
subpwr$Global_active_power=as.numeric(subpwr$Global_active_power)
subpwr$Global_reactive_power=as.numeric(subpwr$Global_reactive_power)
subpwr$Voltage=as.numeric(subpwr$Voltage)
subpwr$Global_intensity=as.numeric(subpwr$Global_intensity)
subpwr$Sub_metering_1=as.numeric(subpwr$Sub_metering_1)
subpwr$Sub_metering_2=as.numeric(subpwr$Sub_metering_2)

#Handle NA Values
subpwr[subpwr$time=="?"]=NA
subpwr[subpwr$Global_active_power=="?"]=NA
subpwr[subpwr$Global_reactive_power=="?"]=NA
subpwr[subpwr$Voltage=="?"]=NA
subpwr[subpwr$Global_intensity=="?"]=NA
subpwr[subpwr$Sub_metering_1=="?"]=NA
subpwr[subpwr$Sub_metering_2=="?"]=NA
subpwr[subpwr$Sub_metering_3=="?"]=NA

#Set Output to the correct number of frames
par(mfrow=c(1,1))


library(dplyr)
library(lubridate)

#Create a datetime field that we can use for the trendline
subpwr$datetime=ymd_hms(paste(subpwr$Date, subpwr$Time))

#Set the output to write to the file
png(file='Plot2.png', height=480, width=480)


#Create the plot
plot(subpwr$datetime
     ,subpwr$Global_active_power
     , type='l'
     , xlab=''
     , ylab="Global Active Power (kilowatts)")

dev.off()