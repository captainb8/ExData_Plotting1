#set working directory
setwd("C:/Users/jbrownlee/Google Drive/Coursera/04_exploratory_data_analysis/course project 1")

#download data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile = "exdata-data-household_power_consumption.zip"
download.file(fileURL, destFile)

#unzip file
unzip(destFile)

#load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#subset the data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#create plot in PNG device, then add lines for addtional variables
png("plot3.png", width=480, height=480)
plot(data$datetime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()

