#read data and select dates
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
data<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

#plot4
par(mfrow=c(2,2))

with(data, plot(Global_active_power~dateTime, type="l", xlab="", ylab="Global active power (kilowatts)"))

with(data, plot(dateTime, Voltage, type="l"))

with(data, plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(data$dateTime, data$Sub_metering_2, type="l", col="red")
lines(data$dateTime, data$Sub_metering_3, type="l", col="blue")               
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6)

with(data, plot(dateTime, Global_reactive_power, type="l"))

#plot4.png
dev.copy(png, "plot4.png", height=480, width=480)
dev.off()
