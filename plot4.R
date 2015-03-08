## Reading the downloaded data file from local folder
rawdata<-read.table("household_power_consumption.txt", header = TRUE, colClasses = "character", sep = ";")

## Extract the portion of the data within the specified time period
data<-filter(rawdata, Date=="1/2/2007" | Date=='2/2/2007')

## Extract the data for plotting
datetime<- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

gap<-as.numeric(data$Global_active_power)

grp<-as.numeric(data$Global_reactive_power)

vol<-as.numeric(data$Voltage)

sm1<-as.numeric(data$Sub_metering_1)
sm2<-as.numeric(data$Sub_metering_2)
sm3<-as.numeric(data$Sub_metering_3)

## Plot all plots in one window
par(mfrow=c(2,2))

## The first plot, row 1 column 1
with(data, plot(datetime, gap, type="l", xlab = "", ylab="Global Active Power"))

## The second plot, row 1 column 2
with(data, plot(datetime, vol, type ="l", ylab = "Voltage"))

## The third plot, row 2 column 1 (3 lines in one plot)
with(data, plot(datetime, sm1, type = "n", xlab = "", ylab="Energy sub metering"))
with(data, lines(datetime, sm1, col="black"))
with(data, lines(datetime, sm2, col="red"))
with(data, lines(datetime, sm3, col="blue"))
legend("topright", lty = c(1,1,1),  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## The fourth plot, row 2 column 2
with(data, plot(datetime, grp, type="l"))

## Copy the plot to specified format and close the PNG device
dev.copy(png, file = "plot4.png", width =480, height=480)
dev.off()
