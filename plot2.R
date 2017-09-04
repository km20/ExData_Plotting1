columns <- read.table("household_power_consumption.txt",sep = ";", header = T,nrows = 1)
data <- read.table("household_power_consumption.txt",na.strings = "?",
                   skip = grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),
                   nrows = 2880,sep=";",col.names = colnames(columns))


strdatetimes <- paste(data$Date, data$Time)
dt <- strptime(strdatetimes,"%d/%m/%Y %H:%M:%S")
plot(dt,data$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "n" )
lines(dt,data$Global_active_power)
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()