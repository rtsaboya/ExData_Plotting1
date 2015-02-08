mydata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
newdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mydata)

# Plot 2

# Merge Date and Time
date_time<-paste(newdata$Date,newdata$Time)
date_time2<-strptime(date_time,"%Y-%m-%d %H:%M:%S")

# Build empty plot
plot(date_time2,newdata$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")

# Add lines
lines (date_time2,newdata$Global_active_power, type="l")

# Testing another way of generating png files:
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()