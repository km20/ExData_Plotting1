columns <- read.table("household_power_consumption.txt",sep = ";", header = T,nrows = 1)
data <- read.table("household_power_consumption.txt",na.strings = "?",
                   skip = grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),
                   nrows = 2880,sep=";",col.names = colnames(columns))


strdatetimes <- paste(data$Date, data$Time)
dt <- strptime(strdatetimes,"%d/%m/%Y %H:%M:%S")
png(file="plot3.png", width = 480, height = 480)

plot(dt,data$Sub_metering_1, xlab="",ylab = "Energy sub metering", type = "n" )
lines(dt,data$Sub_metering_1)
lines(dt,data$Sub_metering_2,col="red")
lines(dt,data$Sub_metering_3,col="blue")

legend("topright",lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()