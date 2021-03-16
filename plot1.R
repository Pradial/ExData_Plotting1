data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
data$Time <- paste(data$Date, data$Time)
data$Date = as.Date(data$Date, "%d/%m/%Y")
firstFeb = as.Date("1/2/2007", "%d/%m/%Y")
secondFeb = as.Date("2/2/2007", "%d/%m/%Y")
data = subset(data, data$Date == firstFeb | data$Date == secondFeb)
data$Time=strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(1, 1))
hist(as.numeric(data$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()