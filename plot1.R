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
png('plot2.png',w=480,h=480)

# PLOT
hist(data_sub$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

# TURN OFF THE PLOTTING DEVICE
dev.off()