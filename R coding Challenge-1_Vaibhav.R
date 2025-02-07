# Vector

z <- (1:200)

# mean
mean(z)

# standard deviation
sd(z)

# creating a logical vector such that true for z values greater than 30 and false otherwise

zlog <- z > 30

# creating a dataframe zdf with z and zlog as columns 

zdf <- data.frame(z , zlog)

# change the column names in new dataframe to zvec and zlogic

colnames(zdf) <- c("zvec" , "zlogic")

# make a new column in dataframe with name zsquared

zdf$zsquared <- zdf$zvec^2

# Subset the dataframe
# with subset function

zdf_subset1 <- subset(zdf, zsquared > 10 & zsquared < 100)

# without using subset function

zdf_subset2 <- zdf[zdf$zsquared > 10 & zdf$zsquared < 100, ]

# subset the zdf dataframe to only include the values on row 26

zdf_row26 <- subset(zdf, zvec == zdf$zvec[26])
zdf_row26 <- zdf[26, ]

# subset the zdf dataframe to only include the values in the column zsquared in the 180th row

zsquared_180 <- zdf$zsquared[180]






