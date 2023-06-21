plot2 <- function() {
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
    png(file = "plot2.png", width = 480, height = 480, units = "px")
    
    # Plotting the Global Active Power against the days in the data set
    # Type of the plot is a line type
    with(dat, plot(datetime, Global_active_power, type = "l",
                   xlab = "", ylab = "Global Active Power (kilowatts)",
                   xaxt = "n"))
    
    # X-axis is added later to add the corresponding weekdays
    axis(1, at = c(min(dat$datetime), median(dat$datetime), max(dat$datetime)),
         labels = c("Thu", "Fri", "Sat"))
    
    # Closing the current device
    dev.off()
}