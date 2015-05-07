#loading in file
epc <- read.table(file.choose(), sep=";", header=FALSE, skip = 66637, nrows = 2880)
colnames(epc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")

#Reformatting Data
epc$Datetime <- paste(epc$Date, epc$Time, sep =' ')
epc$Datetime <- strptime (epc$Datetime, "%Y-%m-%d %H:%M:%S")
epc$Global_active_power<-as.numeric(as.character(epc$Global_active_power))

#Second Graph
png(filename="plot2.png", width = 480, height = 480)
par(mar = c(3, 4, 4, 2))
with(epc, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()