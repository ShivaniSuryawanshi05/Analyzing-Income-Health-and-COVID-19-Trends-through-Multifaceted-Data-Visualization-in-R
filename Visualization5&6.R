library(ggplot2)

covid_2020 <- read.csv("C:/Users/shiva/Downloads/2020 Cases only_RS.csv")
covid_2021 <- read.csv("C:/Users/shiva/Downloads/2021 Cases only_RS.csv")

covid_2020_proc <- subset(covid_2020, select = -c(OBJECTID, Age_group, Case_, Case1, ChartDate) )

names(covid_2020_proc)[12] <- 'ObjectId'

covid_2021_proc <- subset(covid_2021, select = -c(Age_group, Case_, Case1, ChartDate) )

combined_df <- rbind(covid_2020_proc, covid_2021_proc)

combined_df$Date <- as.Date(combined_df$EventDate, "%m/%d/%Y")

final_df <- combined_df[(combined_df$County == 'Polk' | combined_df$County == 'Charlotte' | combined_df$County == 'Flagler' | combined_df$County == 'Jefferson'),]

final_df$County <- factor(final_df$County, levels=c("Polk", "Charlotte", "Flagler", "Jefferson"))

#Creating 2 by 2 visualization

ggplot(final_df, aes(x=Date)) +
  stat_count(geom="line") +
  facet_wrap(~County) +
  labs(x = "Date", y = "Daily Cases", title = "Daily COVID Cases by County")



