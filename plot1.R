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
data.need$Date <- as.Date(data.need$Date,format = "%d/%m/%Y")

#plot 1
data.need$Global_active_power <- as.numeric(levels(data.need$Global_active_power))[data.need$Global_active_power]
hist(data.need$Global_active_power,xlab = "Global Active Power(kilowatts)", ylab = "Frequency",main = "Global Active Power", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()