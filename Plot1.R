#   Exploratory Data Analysis - Peer Graded Assignment 1
#
#   Created By: Mike Stallkamp
#   Created On: 4/2/2017
#
#   Question Number 1 

#setwd("C:\\GitHub\\datasciencecoursera\\exploratorydataanalysis\\ExData_Plotting1")
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

#Set the output to write to the file
png(file='Plot1.png', height=480, width=480)


#Create histogram with the appropriate options
hist(subpwr$Global_active_power
     , main="Global Active Power"
     , col="red"
     , xlab="Global Active Power (kilowatts)")

dev.off()
#2
 
library(dplyr)
library(lubridate)

#Create a datetime field that we can use for the trendline
subpwr$datetime=ymd_hms(paste(subpwr$Date, subpwr$Time))


#Create the plot
plot(subpwr$datetime
     ,subpwr$Global_active_power
     , type='l'
     , xlab=''
     , ylab="Global Active Power (kilowatts)")


#3

#Create a datetime field that we can use for the trendline
subpwr$datetime=ymd_hms(paste(subpwr$Date, subpwr$Time))


#Create the plot
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
      ,tupe='l'
      ,col="blue")

legend("topright"
       , legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
       , col=c("black", "red", "blue")
       , lty=1)

#4
par(mfrow=c(2,2))

plot(subpwr$datetime
     ,subpwr$Global_active_power
     , type='l'
     , xlab=''
     , ylab="Global Active Power (kilowatts)")

plot(subpwr$datetime
     ,subpwr$Voltage
     , type='l'
     , xlab='datetime'
     , ylab="Voltage")

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
      ,tupe='l'
      ,col="blue")

legend("topright"
       , legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
       , col=c("black", "red", "blue")
       , lty=1)


barplot (subpwr$Global_active_power)

?barplot
?plot


summarized
matplot( summarized$datetime,summarized$MeanValue,pch=1)

?plot
?summaris
tail(subpwr)

subpwr$Global_active_power

plot(summarized$datetime,range(summarized$MeanValue)

?lubridate
paste(subpwr$Date, subpwr$Time)

plot(subpwr$datetime, subpwr$Global_active_power, type="o", pch=19)
?plot

group_by(subpwr, Date)

head(subpwr)

?par("USR")

#2/1/2007
#2/2/2007

?lubridate

range(subpwr$Date)
?date
str(subpwr)
?lubridate

?wday

?hist

?plot

tail(subpwr)

?as.Date

?plot