#data import and transform
data <- read.table("data\\household_power_consumption.txt"
                   , sep = ";", header = TRUE, stringsAsFactors = FALSE
                   , comment.char = "", na.strings = "?", nrows = 2075259)


data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, data$Date >= '2007-02-01' & data$Date <= "2007-02-02")
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

Sys.setlocale("LC_TIME", "English")

#chart creation
with(data, plot(Sub_metering_1~Datetime, type = "l", ylab="Energy sub metering", xlab= ""))
lines(data$Sub_metering_2~data$Datetime, type = "l", col = "red")
lines(data$Sub_metering_3~data$Datetime, type = "l", col = "blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#chart export to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
