mydata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
newdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mydata)

# Plot 4

#Merge Date and Time
date_time<-paste(newdata$Date,newdata$Time)
date_time2<-strptime(date_time,"%Y-%m-%d %H:%M:%S")
rm(date_time)

# Create png device
png("plot4.png",width=480, height=480)

# Specify 4 plots
par(mfrow=c(2,2))

# Top Left Plot
plot(date_time2,newdata$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines (date_time2,newdata$Global_active_power, type="l")

# Top Right Plot
plot(date_time2,newdata$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines (date_time2,newdata$Voltage, type="l")

# Bottom Left Plot
plot(date_time2,newdata$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines (date_time2,newdata$Sub_metering_1, type="l")
lines (date_time2,newdata$Sub_metering_2, type="l",col="red")
lines (date_time2,newdata$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

# Bottom Right Plot
plot(date_time2,newdata$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines (date_time2,newdata$Global_reactive_power, type="l")

dev.off()
