data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
data$Time <- paste(data$Date, data$Time)
data$Date = as.Date(data$Date, "%d/%m/%Y")
firstFeb = as.Date("1/2/2007", "%d/%m/%Y")
secondFeb = as.Date("2/2/2007", "%d/%m/%Y")
data = subset(data, data$Date == firstFeb | data$Date == secondFeb)
data$Time=strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

par(mfrow=c(1, 1))
with(data, plot(Time, Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
lines(data$Time, data$Global_active_power)

dev.copy(png, file="plot2.png")
dev.off()