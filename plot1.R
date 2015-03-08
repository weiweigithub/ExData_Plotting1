## Reading the downloaded data file from local folder
library(dplyr)
rawdata<-read.table("household_power_consumption.txt", header = TRUE, colClasses = "character", sep = ";")

## Extract the portion of the data within the specified time period
data<-filter(rawdata, Date=="1/2/2007" | Date=='2/2/2007')

## Extract the data for plotting
gap<-as.numeric(data$Global_active_power)

## Create the required plot
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", cex = 0.5)

## Copy the plot to specified format and close the PNG device
dev.copy(png, file = "plot1.png", width = 480, height =480)
dev.off()