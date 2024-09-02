library(readxl)
library(ggplot2)

cars_data <- read_excel("C:/Users/shiva/Downloads/Simplified Car Sales Data.xlsx")

cars_data_df <- data.frame(cars_data)

cars_data_df_filtered <- subset(cars_data_df, CountryName %in% c("Germany", "USA", "France"))

colnames(cars_data_df_filtered)[2] <- "Country"

#Plot bar graph
ggplot(cars_data_df_filtered, aes(x=Make, y=SalePrice, fill=Country)) +
  geom_bar(stat = "summary_bin", fun=mean, position = "dodge") +
  labs(title="Average Sales by Make for Germany, the USA & France ",
       y = "Average Sales Price") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))