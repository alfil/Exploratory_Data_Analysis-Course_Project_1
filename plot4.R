## This script will use the "Individual household electric power consumption Data Set"
## from UC Irvine Machine Learning Repository to generate four plots of different measures 
## during the dates 01/02/2007 and 02/02/2007 as part of the Course Project 1 of the 
## Exploratory Data Analysis of Coursera Exploratory Data Analysis course


## 1. We load, format and filter source data
# 1.1. Load
data<-read.table("./data/household_power_consumption.txt", sep=";", header=TRUE)
# 1.2. Date Format
data$datetime <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")

# 1.3. Filter and numeric format
filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))
filtered$Sub_metering_1 <- as.numeric(as.character(filtered$Sub_metering_1))
filtered$Sub_metering_2 <- as.numeric(as.character(filtered$Sub_metering_2))
filtered$Sub_metering_3 <- as.numeric(as.character(filtered$Sub_metering_3))
filtered$Voltage <- as.numeric(as.character(filtered$Voltage))
filtered$Global_reactive_power <- as.numeric(as.character(filtered$Global_reactive_power))


## 2. Plots layout
par(mfrow=c(2,2))

## 2.1. Plot 1
with(filtered, plot(datetime,Global_active_power, type="l", ylim=c(0,8), 
                    ylab="Global Active Power", xlab=""))


## 2.2. Plot 2
with(filtered, plot(datetime,Voltage, type="l", ylim=c(234,246), 
                    ylab="Voltage"))

## 2.3. Plot 3  
with(filtered, plot(datetime,Sub_metering_1, type="n", ylim=c(0,40), 
                    ylab="Energy sub metering", xlab=""))

with(filtered, points(datetime,Sub_metering_1, type="l", ylim=c(0,40), 
                      ylab="Energy sub metering", xlab=""))

with(filtered, points(datetime,Sub_metering_2, type="l", ylim=c(0,40), 
                      ylab="Energy sub metering", xlab="", col="red"))

with(filtered, points(datetime,Sub_metering_3, type="l", ylim=c(0,40), 
                      ylab="Energy sub metering", xlab="", col="blue"))

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=c(1,1,1), col=c("black","red","blue"))



## 2.4. Plot 4
with(filtered, plot(datetime,Global_reactive_power, type="l", ylim=c(0.0,0.5), 
                    ylab="Global_reactive_power"))


