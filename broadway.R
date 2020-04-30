
# Packages

library(tidyverse)  # data manipulation
library(lubridate)  # dealing with the date variables
library(patchwork) # combining plots
library(ggdark)  # dark theme

# Get the Data

grosses <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-28/grosses.csv')

# The data

glimpse(grosses)

grosses$year <- year(grosses$week_ending)

# Data Viz
# Graph 1

p1 <- grosses %>%
  filter(show == "The Lion King") %>%
  ggplot(aes(week_ending, seats_sold)) +
  geom_col(aes(fill=I("orchid"))) +
  xlab("week ending")+
  ylab("seats sold")+
  scale_x_date(date_breaks = "3 years", date_labels = "%Y") +
  labs(title = "BROADWAY",
       subtitle = "\nSeats sold by week for The Lion King")

# modify the theme to your liking, as you would in ggplot2
p1 <- p1 + dark_theme_gray(base_family = "Fira Sans Condensed Light", base_size = 14) + 
  theme(plot.title = element_text(family = "Fira Sans Condensed", hjust = 1, size = 26),
        plot.background = element_rect(fill = "grey10"),
        panel.background = element_blank(),
        panel.grid.major = element_line(color = "grey30", size = 0.2),
        panel.grid.minor = element_line(color = "grey30", size = 0.2),
        legend.background = element_blank(),
        axis.ticks = element_blank(),
        legend.key = element_blank(),
        legend.position = c(0.815, 0.27))

p1

# Graph 2

p2 <- grosses %>%
  filter(show == "The Lion King") %>%
  ggplot(aes(week_ending, avg_ticket_price)) +
  geom_col(aes(fill = I("#5284EB")))+
  xlab("week ending")+
  ylab("average ticket price")+
  scale_x_date(date_breaks = "3 years", date_labels = "%Y") +
  labs(
       subtitle = "Average ticket price for The Lion King")


p2 <- p2 + dark_theme_gray(base_family = "Fira Sans Condensed Light", base_size = 14) + 
  theme(plot.title = element_text(family = "Fira Sans Condensed", hjust = 1),
        plot.background = element_rect(fill = "grey10"),
        panel.background = element_blank(),
        panel.grid.major = element_line(color = "grey30", size = 0.2),
        panel.grid.minor = element_line(color = "grey30", size = 0.2),
        legend.background = element_blank(),
        axis.ticks = element_blank(),
        legend.key = element_blank(),
        legend.position = c(0.815, 0.27))

p2

# Graph 3

p3<- grosses %>%
  filter(show == "The Lion King") %>%
  ggplot(aes(week_ending, pct_capacity)) +
  geom_col(aes(fill = I("#EBB852"))) +
  xlab("week ending")+
  ylab("seats sold")+
  scale_x_date(date_breaks = "3 years", date_labels = "%Y") +
  labs(
       subtitle = "Percent of theatre capacity sold for The Lion King")

p3 <- p3 + dark_theme_gray(base_family = "Fira Sans Condensed Light", base_size = 14) + 
  theme(plot.title = element_text(family = "Fira Sans Condensed", hjust = 1),
        plot.background = element_rect(fill = "grey10"),
        panel.background = element_blank(),
        panel.grid.major = element_line(color = "grey30", size = 0.2),
        panel.grid.minor = element_line(color = "grey30", size = 0.2),
        legend.background = element_blank(),
        axis.ticks = element_blank(),
        legend.key = element_blank(),
        legend.position = c(0.815, 0.27))

# patchwork package in action

p1 + p2 + p3 + plot_layout(ncol=1)
