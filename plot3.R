mydata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
newdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mydata)

# Plot 3

#Merge Date and Time
date_time<-paste(newdata$Date,newdata$Time)
date_time2<-strptime(date_time,"%Y-%m-%d %H:%M:%S")
rm(date_time)

# Create png device
png("plot3.png",width=480, height=480)

# Create an empty plot
plot(date_time2,newdata$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")

# Add variables
lines (date_time2,newdata$Sub_metering_1, type="l")
lines (date_time2,newdata$Sub_metering_2, type="l",col="red")
lines (date_time2,newdata$Sub_metering_3, type="l",col="blue")

# Add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

dev.off()