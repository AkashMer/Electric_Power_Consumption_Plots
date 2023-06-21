plot4 <- function() {
    # Installing and loading the required packages for this script
    if(system.file(package = "dplyr") == "") install.packages("dplyr", quiet = TRUE)
    library(dplyr, quietly = TRUE)
    
    # Reading the power consumption file
    fileName <- "household_power_consumption.txt"
    tmp <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
    
    # Subsetting to only include dates 2007-02-01 and 2007-02-02
    dat <- subset(tmp, Date == "1/2/2007"| Date == "2/2/2007")
    
    # Converting the separate date and time columns into a single column
    # represented as a POSIXct class
    dat <- dat %>%
        mutate(datetime = paste0(Date, " ", Time)) %>%
        mutate(datetime = as.POSIXct(datetime, format = "%d/%m/%Y %H:%M:%S"))
    
    # Opening the png device
    png(file = "plot4.png", width = 480, height = 480, units = "px")
    
    # Dividing the device into 4 parts to plot 4 different plots
    par(mfcol = c(2,2))
    
    ## Plot no. 1
    # Plotting the Global Active Power against the days in the data set
    # Type of the plot is a line type
    with(dat, plot(datetime, Global_active_power, type = "l",
                   xlab = "", ylab = "Global Active Power (kilowatts)",
                   xaxt = "n"))
    # X-axis is added later to add the corresponding weekdays
    axis(1, at = c(min(dat$datetime), median(dat$datetime), max(dat$datetime)),
         labels = c("Thu", "Fri", "Sat"))
    
    ## Plot no. 2
    # Plotting the Sub metering against the days in the data set
    # Type of the plot is a line type
    with(dat, plot(datetime, Sub_metering_1, type = "n",
                   xlab = "", ylab = "Energy sub metering",
                   xaxt = "n"))
    # Plotting the lines for each Sub metering
    with(dat, lines(datetime, Sub_metering_1, col = "black"))
    with(dat, lines(datetime, Sub_metering_2, col = "red"))
    with(dat, lines(datetime, Sub_metering_3, col = "blue"))
    # X-axis is added later to add the corresponding weekdays
    axis(1, at = c(min(dat$datetime), median(dat$datetime), max(dat$datetime)),
         labels = c("Thu", "Fri", "Sat"))
    # Introducing the legend
    legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
           names(dat)[7:9], bty = "n", cex = 0.9)
    
    ## Plot no. 3
    # Plotting voltage against the datetime
    # Line type plot
    with(dat, plot(datetime, Voltage, type = "l",xaxt = "n"))
    # X-axis is added later to add the corresponding weekdays
    axis(1, at = c(min(dat$datetime), median(dat$datetime), max(dat$datetime)),
         labels = c("Thu", "Fri", "Sat"))
    
    ## Plot no. 4
    # Plotting global reactive power against the datetime
    # Line type plot
    with(dat, plot(datetime, Global_reactive_power, type = "l",xaxt = "n"))
    # X-axis is added later to add the corresponding weekdays
    axis(1, at = c(min(dat$datetime), median(dat$datetime), max(dat$datetime)),
         labels = c("Thu", "Fri", "Sat"))
    
    # Closing the current device
    dev.off()
}