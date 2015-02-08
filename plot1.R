mydata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
newdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mydata)

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(newdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()

