#data import and transform
data <- read.table("data\\household_power_consumption.txt"
                   , sep = ";", header = TRUE, stringsAsFactors = FALSE
                   , comment.char = "", na.strings = "?", nrows = 2075259)


data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, data$Date >= '2007-02-01' & data$Date <= "2007-02-02")
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))


Sys.setlocale("LC_TIME", "English")

#chart creation
par(mfrow=c(2,2), mar=c(4,5,2,2))

with(data, {
  plot(Global_active_power~Datetime, type = "l", ylab="Global Active Power", xlab= "")

  plot(Voltage~Datetime, type="l", ylab="Voltage")
  
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(data$Sub_metering_2~data$Datetime, type = "l", col = "red")
  lines(data$Sub_metering_3~data$Datetime, type = "l", col = "blue")
  legend("topright", col=c("black", "red", "blue"), lty=1:2, cex=0.8, bty = "n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power")
})


#chart export to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
