## Reading the downloaded data file from local folder
rawdata<-read.table("household_power_consumption.txt", header = TRUE, colClasses = "character", sep = ";")

## Extract the portion of the data within the specified time period
data<-filter(rawdata, Date=="1/2/2007" | Date=='2/2/2007')

## Extract the data for plotting
datetime<- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

sm1<-as.numeric(data$Sub_metering_1)
sm2<-as.numeric(data$Sub_metering_2)
sm3<-as.numeric(data$Sub_metering_3)

## Start plotting useing the basic plotting system
with(data, plot(datetime, sm1, type = "n", xlab="", ylab="Energy sub metering"))
with(data, lines(datetime, sm1, col="black"))
with(data, lines(datetime, sm2, col="red"))
with(data, lines(datetime, sm3, col="blue"))

## Adding legend
legend("topright",
       lty = c(1,1,1),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy the plot to specified format and close the PNG device
dev.copy(png, file = "plot3.png", width =480, height=480)
dev.off()