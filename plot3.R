## This script will use the "Individual household electric power consumption Data Set"
## from UC Irvine Machine Learning Repository to generate three line plots of the Sub meterings 
## during the dates 01/02/2007 and 02/02/2007 as part of the Course Project 1 of the 
## Exploratory Data Analysis of Coursera Exploratory Data Analysis course


## 1. We load, format and filter source data
# 1.1. Load
data<-read.table("./data/household_power_consumption.txt", sep=";", header=TRUE)
# 1.2. Format
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

# 1.3. Filter
filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
filtered$Sub_metering_1 <- as.numeric(as.character(filtered$Sub_metering_1))
filtered$Sub_metering_2 <- as.numeric(as.character(filtered$Sub_metering_2))
filtered$Sub_metering_3 <- as.numeric(as.character(filtered$Sub_metering_3))


## 2. We create the graph
with(filtered, plot(DateTime,Sub_metering_1, type="n", ylim=c(0,40), 
                    ylab="Energy sub metering", xlab=""))

with(filtered, points(DateTime,Sub_metering_1, type="l", ylim=c(0,40), 
                    ylab="Energy sub metering", xlab=""))

with(filtered, points(DateTime,Sub_metering_2, type="l", ylim=c(0,40), 
                    ylab="Energy sub metering", xlab="", col="red"))

with(filtered, points(DateTime,Sub_metering_3, type="l", ylim=c(0,40), 
                    ylab="Energy sub metering", xlab="", col="blue"))

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=c(1,1,1), col=c("black","red","blue"))

