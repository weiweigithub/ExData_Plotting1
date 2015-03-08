## Reading the downloaded data file from local folder
rawdata<-read.table("household_power_consumption.txt", header = TRUE, colClasses = "character", sep = ";")

## Extract the portion of the data within the specified time period
data<-filter(rawdata, Date=="1/2/2007" | Date=='2/2/2007')

## Extract the data for plotting
gap<-as.numeric(data$Global_active_power)

datetime<- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

with(data, plot(datetime, gap, type ="l", xlab="", ylab = "Global Active Power(killowatts)"))

## Copy the plot to specified format and close the PNG device
dev.copy(png, file = "plot2.png", width =480, height=480)
dev.off()