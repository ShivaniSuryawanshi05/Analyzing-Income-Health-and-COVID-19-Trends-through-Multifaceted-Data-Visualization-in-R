library(readxl)
library(ggplot2)
data1 <- read_excel("C:/Users/shiva/Downloads/2018 Data-1.xlsx")
data2.df <- data.frame(data1)

names(data2.df)
attach(data2.df)

plt <- ggplot(data2.df, aes(x = Median.Family.Income, y=Perc.with.health.Insurance))

plt + geom_point(shape= '+',color="green", size =Obesity.Rates) +
  labs(title = "Median Family Income vs. % of Population with Health Insurance",
       x = "Median Family Income",
       y = "% of Population with Health Insurance"
       )