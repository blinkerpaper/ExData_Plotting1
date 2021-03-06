##Read and organize the data
household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
splitbydate <- split(household, household$Date)
Feb1 <- splitbydate$"1/2/2007"
Feb2 <- splitbydate$"2/2/2007"
data <- rbind(Feb1, Feb2)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

##Generate Plot 1 as PNG
png(file = "plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, main = "Global Active Power", col = "Red", xlab="Global Active Power (kilowatts)"))
dev.off()
