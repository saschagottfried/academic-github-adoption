# Author: Christopher Peters
# Email: cpeter9@gmail.com
# A look at the number of public github repositories coded in LaTex
# that are created each month.
library(ggplot2)
library(lubridate)
library(ggthemes)

df <- read.csv("data.csv", header = F)
names(df) <- c("repo", "created_at")
df$created_at <- as.POSIXct(df$created_at)
df <- df[df$created_at < max(df$created_at) - days(14), ]

ggplot(df, aes(x = created_at)) +
  scale_y_continuous(breaks = seq(0, 150, 25)) +
  geom_hline(yintercept = 25, colour = "red", linetype="dotted") +
  geom_hline(yintercept = 50, colour = "red", linetype="dotted") +
  geom_hline(yintercept = 75, colour = "red", linetype="dotted") +
  geom_hline(yintercept = 100, colour = "red", linetype="dotted") +
  geom_hline(yintercept = 125, colour = "red", linetype="dotted") +
  geom_histogram(colour = "black", fill = "tan", binwidth = 60*60*24*30.5, stat = "bin") +
  xlab("") +
  ylab("") +
  ggtitle("Public Github Repositories\nwritten in LaTeX per Month") +
  theme_solarized(light = F) + 
  theme(axis.text.x = element_text(size = 32),
        axis.text.y = element_text(size = 28),
        plot.title = element_text(size = 30))