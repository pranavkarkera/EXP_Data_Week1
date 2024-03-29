data <- read.csv("household_power_consumption.txt", sep=";")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subsetdata <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)

png("plot1.png", width=480, height = 480)
hist(subsetdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kiloWatts)", col = "red")

graphics.off()


