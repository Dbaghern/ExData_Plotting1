#loading in file
epc <- read.table(file.choose(), sep=";", header=FALSE, skip = 66637, nrows = 2880)
colnames(epc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")

#Reformatting Data
epc$Datetime <- paste(epc$Date, epc$Time, sep =' ')
epc$Datetime <- strptime (epc$Datetime, "%Y-%m-%d %H:%M:%S")
epc$Global_active_power<-as.numeric(as.character(epc$Global_active_power))

#First graph
png(filename="plot1.png", width = 480, height = 480)
hist(epc$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency", col = "red")
dev.off()