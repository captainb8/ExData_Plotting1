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

#create hist on screen device
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#copy to PNG
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

