# assignment 1
library(lubridate)
library(tidyr)


data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = F)
data <- tbl_df(data)
data$Date <- dmy(data$Date)
#data$Time <- hms(data$Time) #parsing
data <- filter(data, Date>= ymd(20070201) & Date <= ymd(20070202)) # discarding data we won't use

