## Q1

# Load dataset of MycotoxinData
MycotoxinData <- read.csv("MycotoxinData.csv", na.strings = "na")

# structure of the dataframe
str(MycotoxinData_data)

# Q2 

# plotting data using ggplota2 (Boxplot)

library(ggplot2)

ggplot(MycotoxinData, aes(x = Treatment, y = DON, colour = Cultivar)) + 
  geom_boxplot() +
  xlab("") +
  ylab("DON(ppm)")

## Q3

#Barplots
ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") + 
  ylab("DON(ppm)")

## Q4

# Add points to the foreground of the boxplot and bar chart you made in 
# question 3 that show the distribution of points over the boxplots. 
# Set the shape = 21 and the outline color black (hint: use jitter_dodge). 

## Q4_A
ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  stat_summary(fun = mean, geom = "bar", position = "dodge") +  
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +  
  geom_point(shape = 21, color = "black", position = position_jitterdodge(dodge.width = 0.9)) +
  xlab("") +
  ylab("DON(ppm)")

## Q4_B
ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(shape = 21, color = "black", position = position_jitterdodge(dodge.width = 0.9)) +
  xlab("") +
  ylab("DON(ppm)")

# Q5 

# Change the fill color of the points and boxplots to match some colors
# in the following colorblind pallet

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73",
                "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(shape = 21, color = "black", position = position_jitterdodge(dodge.width = 0.9)) +
  scale_fill_manual(values = cbbPalette) +
  xlab("") +
  ylab("DON(ppm)")

# Q6

# Add a facet to the plots based on cultivar
# A)

ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(shape = 21, color = "black", position = position_jitterdodge(dodge.width = 0.9)) +
  scale_fill_manual(values = cbbPalette) +
  xlab("") +
  ylab("DON(ppm)") +
  facet_wrap(~Cultivar)

# B)

ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  stat_summary(fun = mean, geom = "bar", position = "dodge") +  
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +  
  geom_point(shape = 21, color = "black", position = position_jitterdodge(dodge.width = 0.9)) +
  scale_fill_manual(values = cbbPalette) +
  xlab("") +
  ylab("DON(ppm)") +
  facet_wrap(~Cultivar)

# Q7

# Add transparency to the points so you can still see the boxplot or bar in the background

# A)

ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(shape = 21, color = "black", alpha = 0.5, position = position_jitterdodge(dodge.width = 0.9)) +
  scale_fill_manual(values = cbbPalette) +
  xlab("") +
  ylab("DON(ppm)") +
  facet_wrap(~Cultivar)

# B)

ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  stat_summary(fun = mean, geom = "bar", position = "dodge") +  
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +  
  geom_point(shape = 21, color = "black", alpha = 0.5, position = position_jitterdodge(dodge.width = 0.9)) +
  scale_fill_manual(values = cbbPalette) +
  xlab("") +
  ylab("DON(ppm)") +
  facet_wrap(~Cultivar)

# Q8

# Plotting data using violin plots and Jitterpoints

ggplot(data = Mycotoxin_Data, aes( x = Treatment, y = DON, fill = Cultivar))+
  geom_violin(trim = FALSE, alpha = 0.5)+
  geom_point(shape = 21, col = "black", alpha = 0.5, position = position_jitterdodge(dodge.width = 0.9))+
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON (ppm)") +
  facet_wrap(~Cultivar)

# Answer: I choosed violin plot because it show summary 
# statistics and distribution of data points in the plots.





































  

  
  





