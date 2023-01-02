#read data and select dates
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
data<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

#convert date and time
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dateTime<-paste(data$Date, data$Time)
data$dateTime<-as.POSIXct(dateTime, format = "%Y-%m-%d %H:%M:%S")

#plot2
with(data, plot(Global_active_power~dateTime, type="l", xlab="", ylab="Global active power (kilowatts)"))

#plot2.png
dev.copy(png, "plot2.png", height=480, width=480)
dev.off()
