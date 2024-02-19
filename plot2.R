data <- read.csv("household_power_consumption.txt", sep=";")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subsetdata$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(datetime,globalactivepower,type = "l", col = "black", xlab = "Days", ylab = "Global Active Power (kilowatts)")

graphics.off()