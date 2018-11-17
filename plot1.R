#data import and transform
data <- read.table("data\\household_power_consumption.txt"
                   , sep = ";", header = TRUE, stringsAsFactors = FALSE
                   , comment.char = "", na.strings = "?", nrows = 2075259)


data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, data$Date >= '2007-02-01' & data$Date <= "2007-02-02")


#chart creation
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")


#chart export to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()