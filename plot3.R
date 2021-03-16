data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
data$Time <- paste(data$Date, data$Time)
data$Date = as.Date(data$Date, "%d/%m/%Y")
firstFeb = as.Date("1/2/2007", "%d/%m/%Y")
secondFeb = as.Date("2/2/2007", "%d/%m/%Y")
data = subset(data, data$Date == firstFeb | data$Date == secondFeb)
data$Time=strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

png(filename = "plot3.png", width = 480, height = 480)

par(mfrow=c(1, 1))
with(data, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.off()