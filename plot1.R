columns <- read.table("household_power_consumption.txt",sep = ";", header = T,nrows = 1)
data <- read.table("household_power_consumption.txt",na.strings = "?",
    skip = grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),
    nrows = 2880,sep=";",col.names = colnames(columns))

hist(data$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()