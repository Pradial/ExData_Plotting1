data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
data$Time <- paste(data$Date, data$Time)
data$Date = as.Date(data$Date, "%d/%m/%Y")
firstFeb = as.Date("1/2/2007", "%d/%m/%Y")
secondFeb = as.Date("2/2/2007", "%d/%m/%Y")
data = subset(data, data$Date == firstFeb | data$Date == secondFeb)
data$Time=strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2, 2))
with(data,{
  plot(Time, as.numeric(Global_active_power), type="n", ylab="Global Active Power", xlab="")
  lines(Time, Global_active_power)
  
  plot(Time, Voltage, type="n", ylab="Voltage", xlab="datetime")
  lines(Time, Voltage)
  
  plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  lines(Time, Sub_metering_1)
  lines(Time, Sub_metering_2, col="red")
  lines(Time, Sub_metering_3, col="blue")
  legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=1, bty = "n")
  
  plot(Time, as.numeric(Global_reactive_power), type="n", xlab="datetime", ylab="Global_reactive_power")
  lines(Time, as.numeric(Global_reactive_power))
})

dev.off()