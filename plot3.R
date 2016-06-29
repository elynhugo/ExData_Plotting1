#download data set
if (!file.exists("Gweek1"))  {dir.create("Gweek1")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "Gweek1/assignment.zip"
download.file(fileUrl, filename)
if (!file.exists("household_power_consumption.txt")) {
  unzip(filename)
}

#loading the data
dataset <- read.table("household_power_consumption.txt",header =  TRUE, sep = ";")
data.need <- dataset[(dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"), ]


#plot 3
data.need$Sub_metering_1 <- as.numeric(levels(data.need$Sub_metering_1))[data.need$Sub_metering_1]
data.need$Sub_metering_2 <- as.numeric(levels(data.need$Sub_metering_2))[data.need$Sub_metering_2]
datatime <- strptime(paste(data.need$Date,data.need$Time),"%d/%m/%Y %H:%M:%S")
plot(datatime, data.need$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
points(datatime, data.need$Sub_metering_2,type = "l",col= "red")
points(datatime, data.need$Sub_metering_3,type = "l",col= "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,col = c("black","red","blue"),y.intersp = 0.5)
dev.copy(png, file = "plot3.png")
dev.off