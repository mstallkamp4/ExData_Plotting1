#   Exploratory Data Analysis - Peer Graded Assignment 1
#
#   Created By: Mike Stallkamp
#   Created On: 4/2/2017
#   
#   Question Number 4

#Import Libraries that are needed
library(dplyr)
library(lubridate)

#Read Data
pwr<-read.csv(".\\data\\household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

getwd
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

#Create a datetime field that we can use for the trendline
subpwr$datetime=ymd_hms(paste(subpwr$Date, subpwr$Time))

#Set the output to write to the file
png(file='Plot4.png', height=480, width=480)

#Set Output to the correct number of frames
par(mfrow=c(2,2))


#First panel shows Global Active power over time
plot(subpwr$datetime
     ,subpwr$Global_active_power
     , type='l'
     , xlab=''
     , ylab="Global Active Power (kilowatts)")

#Second panel shows  Voltage over time
plot(subpwr$datetime
     ,subpwr$Voltage
     , type='l'
     , xlab='datetime'
     , ylab="Voltage")

#Third panel has our sub metering plot
plot(subpwr$datetime
     ,subpwr$Sub_metering_1
     , type='l'
     , xlab=''
     , ylab="Energy Sub Metering"
)

lines(subpwr$datetime
      ,subpwr$Sub_metering_2
      ,type="l"
      ,col="red")

lines(subpwr$datetime
      ,subpwr$Sub_metering_3
      ,type='l'
      ,col="blue")

legend("topright"
       , legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
       , col=c("black", "red", "blue")
       , lty=1)

#It is not clear to me what is being asked for the fourth panel
#The raw data suggest that this may be an average by time?
#here is my pass at it:

#group the set by the datetime
grouped<-group_by(subpwr, datetime)
#Summarize the data
summarized<-summarize(grouped, mean(Global_active_power))
#Created a new column with a better name for mean
summarized$MeanValue=summarized$`mean(Global_active_power)`

#beauty ensues!
plot(subpwr$datetime
     ,subpwr$Global_active_power
     ,type="o"
     ,pch=19
     ,xlab="Global_active_power"
     ,ylab="datetime")

dev.off()

