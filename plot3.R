### LOAD THE DATA

# LOAD THE LOCAL FILE
data <- read.csv('../household_power_consumption.txt', sep=";", na.strings="?")

# CONVERT THE DATE/TIME STRINGS TO DAT/TIME OBJECTS
data$DayHour = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(strptime(data$Date, "%d/%m/%Y"))
data$Time = strptime(data$Time, "%H:%M:%S")

# DATE RANGES
minDate <- as.Date(strptime("2007-02-01", "%Y-%m-%d"))
maxDate <- as.Date(strptime("2007-02-02", "%Y-%m-%d"))

# FILTER THE DATA
data_sub <- subset(data, Date >= minDate & Date <= maxDate)

### CREATE THE PNG PLOT

# SET PLOTTING DEVICE
 png('plot3.png',w=480,h=480)

# PLOT
plot(data_sub$DayHour,
     data_sub$Sub_metering_1,
     type="n",
     main="",
     xlab="",
     ylab="Energy sub metering")

points(data_sub$DayHour,
       data_sub$Sub_metering_1,
       type="l", col="black")

points(data_sub$DayHour,
       data_sub$Sub_metering_2,
       type="l", col="red")

points(data_sub$DayHour,
       data_sub$Sub_metering_3,
       type="l", col="blue")

legend("topright",
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1)



# TURN OFF THE PLOTTING DEVICE
 dev.off()