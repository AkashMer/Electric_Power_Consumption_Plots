# README file for the plots

This file contains the steps to take to reproduce the same plots

1.  **Download the required data** : Use the `download_data.R` to defines a function download_data() which downloads the required data for the production of plots. This data is saved in the current working directory.

2.  **Source the required R scipts** : Source the following files: `plot1.R`, `plot2.R`, `plot3.R`, and `plot4.R` to your R session. These R scripts were written in

    ```         
    "R version 4.3.0 (2023-04-21 ucrt)"
    ```

    They define the functions named the same as the file name which does the following,

    -   **Download if required and load the required packages** for the code. `dplyr` package version `1.1.2`
    -   **Read in the electric power consumption data** from the file name "household_power_consumption.txt", make sure the downloaded data has the above mentioned file name for this R sciprts to work if `download_data.R` was not used
    -   **Subsetting the data** set to include only information for 2007-02-01 and 2007-02-02
    -   **POSIXct conversion** of date and time information
    -   **Opening the PNG device** of size 480\*480 pixels
    -   **Plotting** the corresponding plot to the png device
    -   **Closing the PNG device**

3.  **Obtaining PNG plots** : Run the plot1 through plot4 functions and they will plot the corresponding plots as separate PNG files in your current working directory
