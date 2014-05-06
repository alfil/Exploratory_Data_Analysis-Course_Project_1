## This script will use the "Individual household electric power consumption Data Set"
## from UC Irvine Machine Learning Repository to generate a histogram of the Global 
## Active Power (in kilowatts) during the dates 01/02/2007 and 02/02/2007 as part of the 
## Course Project 1 of the Exploratory Data Analysis of Coursera Exploratory Data Analysis course


## 1. We load, format and filter source data
# 1.1. Load
data<-read.table("./data/household_power_consumption.txt", sep=";", header=TRUE)
# 1.2. Format
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

# 1.3. Filter
filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))


## 2. We create the graph
hist(filtered$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power(kilowatts)", col="red", ylim=c(0,1200))









