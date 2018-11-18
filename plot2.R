#data import and transform
data <- read.table("data\\household_power_consumption.txt"
                   , sep = ";", header = TRUE, stringsAsFactors = FALSE
                   , comment.char = "", na.strings = "?", nrows = 2075259)


data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, data$Date >= '2007-02-01' & data$Date <= "2007-02-02")
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

Sys.setlocale("LC_TIME", "English")

#chart creation
with(data, plot(Global_active_power~Datetime, type = "l", ylab="Global Active Power (kilowatts)", xlab= ""))


#chart export to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
