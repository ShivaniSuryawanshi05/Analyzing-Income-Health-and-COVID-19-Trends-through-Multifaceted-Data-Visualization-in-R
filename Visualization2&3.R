library(readxl)
library(ggplot2)

#Pasco Data

Pasco_data <- read_excel("C:/Users/shiva/Downloads/Combined.xlsx", sheet = 'Pasco')

# Convert the data frame
Pasco_data.df <- data.frame(Pasco_data)
colnames(Pasco_data.df) <- c('Date', 'Number.of.Cases', 'Moving.Average')
Pasco_data.df$Date <- as.Date(Pasco_data.df$Date, "%B %d, %Y")

# Create a line chart
ggplot(Pasco_data.df, aes(x = Date)) +
  geom_line(aes(y = Number.of.Cases), color = "orange") +
  geom_line(aes(y = Moving.Average), color = "black") +
  labs(title = "Pasco's COVID-19 Curve: No.of Daily Cases & Moving Average",
       y = "")

# Hillsborough Data

Hillsborough_data <- read_excel("C:/Users/shiva/Downloads/Combined.xlsx", sheet = 'Hillsborough')

# Convert the data frame
Hillsborough_data.df <- data.frame(Hillsborough_data)
colnames(Hillsborough_data.df) <- c('Date', 'Number.of.Cases', 'Moving.Average')
Hillsborough_data.df$Date <- as.Date(Hillsborough_data.df$Date, "%B %d, %Y")

# Line chart for Number of Cases
ggplot(Hillsborough_data.df, aes(x = Date)) +
  geom_line(aes(y = Number.of.Cases), color = "black") +
  labs(title = "Daily Number of Cases for Hillsborough",
       y = "Number of Cases")

# Column chart for Moving Average
ggplot(Hillsborough_data.df, aes(x = Date)) +
  geom_col(aes(y = Moving.Average), fill = "red") +
  labs(title = "Moving Average for Hillsborough",
       y = "Moving Average")

# Combine the two plots

ggplot(Hillsborough_data.df, aes(x=Date, y=Moving.Average)) +
  geom_line(aes(y=Number.of.Cases), color="black") +
  geom_col(color="red") +
  labs(title = "Moving Average and Number of Daily Cases for Hillsborough",
       y = "")
