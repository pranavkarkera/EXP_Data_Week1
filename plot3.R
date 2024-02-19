file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
SubMetering1 <- as.numeric(subsetdata$Sub_metering_1)
SubMetering2 <- as.numeric(subsetdata$Sub_metering_2)
SubMetering3 <- as.numeric(subsetdata$Sub_metering_3)

png("plot3.png",height=480,width=480)
plot(datetime,SubMetering1,type="l",ylab="Energy Submetering")
lines(datetime,SubMetering2,type="l",col="red")
lines(datetime,SubMetering3,type="l",col='blue')
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1)

graphics.off()