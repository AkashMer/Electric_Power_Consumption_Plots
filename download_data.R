download_data <- function() {
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    temp <- tempfile()
    download.file(fileURL, temp, method = "curl")
    unzip(temp) # Extracts the data
    unlink(temp) # Deletes the zip
}