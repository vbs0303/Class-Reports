
# a.	Jitter points over the boxplot and fill the points and boxplots Cultivar with two colors from the cbbPallete introduced last week. 
# b.	Change the transparency of the jittered points to 0.6. 
# c.	The y-axis should be labeled "DON (ppm)", and the x-axis should be left blank. 
# d.	The plot should use a classic theme
# e.	The plot should also be faceted by Cultivar


# Q1

# Load dataset of MycotoxinData
Mycotoxin_Data <- read.csv("MycotoxinData.csv", na.strings = "na")

# structure of the dataframe
str(Mycotoxin_Data_data)

# plotting data using ggplota2 (Boxplot)

library(ggplot2)

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


DON.Plot <- ggplot(Mycotoxin_Data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  xlab("") + 
  ylab("DON (ppm)") + 
  geom_point(alpha = 0.6, pch = 21, color = "black", position = position_jitterdodge()) +
  scale_color_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar)

DON.Plot

## Q2

# Change the factor order level so that the treatment “NTC” is first, followed by 
# “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70. 

Mycotoxin_Data$Treatment <- factor(Mycotoxin_Data$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))

ggplot(Mycotoxin_Data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  xlab("") + 
  ylab("DON (ppm)") + 
  geom_point(alpha = 0.6, pch = 21, color = "black", position = position_jitterdodge()) +
  scale_color_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar)

## Q3

# Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label 
# should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 
# 1 and 3 into three separate R objects

# Q1.plot

DON.Plot <- ggplot(Mycotoxin_Data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  xlab("") + 
  ylab("DON (ppm)") + 
  geom_point(alpha = 0.6, pch = 21, color = "black", position = position_jitterdodge()) +
  scale_color_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar)

DON.Plot

# X15ADON Plot

X15ADON.Plot <- ggplot(Mycotoxin_Data, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  xlab("") + 
  ylab("15ADON") + 
  geom_point(alpha = 0.6, pch = 21, color = "black", position = position_jitterdodge()) +
  scale_color_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar)

X15ADON.Plot

# Seed Mass Plot

Seed.mass.plot <- ggplot(Mycotoxin_Data, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  xlab("") + 
  ylab("Seed Mass (mg)") + 
  geom_point(alpha = 0.6, pch = 21, color = "black", position = position_jitterdodge()) +
  scale_color_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar)

Seed.mass.plot


## Q4

# Use ggarrange function to combine all three figures into one with three 
# columns and one row. Set the labels for the subplots as A, B and C. Set the 
# option common.legend = T within ggarage function. What did the common.legend option do?

library(ggpubr)

Combine.plot <- ggarrange(
  DON.Plot,
  X15ADON.Plot, 
  Seed.mass.plot, 
  labels = c("A", "B", "C"),
  nrow = 1,
  ncol = 3,
  common.legend = TRUE,
  legend = "bottom"
)

Combine.plot

### Answer: If we use common ligend function then we don't need to assign the same legend for every plot.
### There will be only one common legend for all plots. 




## Q5

# Use geom_pwc() to add t.test pairwise comparisons to the three plots made above. 
# Save each plot as a new R object, and combine them again with ggarange as you did in question 4. 

# a)
DONplot.pwc <- ggplot(Mycotoxin_Data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  xlab("") + 
  ylab("DON (ppm)") + 
  geom_point(alpha = 0.6, pch = 21, color = "black", position = position_jitterdodge()) +
  scale_color_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar) +
stat_compare_means(method = "t.test", label = "p.signif", 
                   comparisons = list(c("NTC", "Fg"), 
                                      c("Fg", "Fg + 37"), 
                                      c("Fg + 37", "Fg + 40"), 
                                      c("Fg + 40", "Fg + 70")))

DONplot.pwc


# b)
X15ADONplot.pwc <- ggplot(Mycotoxin_Data, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  xlab("") + 
  ylab("15ADON") + 
  geom_point(alpha = 0.6, pch = 21, color = "black", position = position_jitterdodge()) +
  scale_color_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar) +
  stat_compare_means(method = "t.test", label = "p.signif", 
                     comparisons = list(c(c("NTC", "Fg"), 
                                          c("Fg", "Fg + 37"), 
                                          c("Fg + 37", "Fg + 40"), 
                                          c("Fg + 40", "Fg + 70")))

X15ADONplot.pwc

# c) 
Seed.massplot.pwc <- ggplot(Mycotoxin_Data, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  xlab("") + 
  ylab("Seed Mass (mg)") + 
  geom_point(alpha = 0.6, pch = 21, color = "black", position = position_jitterdodge()) +
  scale_color_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar) +
  stat_compare_means(method = "t.test", label = "p.signif", 
                     comparisons = list(c("NTC", "Fg"), 
                                        c("Fg", "Fg + 37"), 
                                        c("Fg + 37", "Fg + 40"), 
                                        c("Fg + 40", "Fg + 70")))

Seed.massplot.pwc


Combineplot.pwc <- ggarrange(
  DONplot.pwc,
  X15ADONplot.pwc, 
  Seed.massplot.pwc, 
  labels = c("A", "B", "C"),
  nrow = 1,
  ncol = 3,
  common.legend = TRUE,
  legend = "bottom"
)

Combineplot.pwc



