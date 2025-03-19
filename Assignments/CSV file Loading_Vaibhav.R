# Read the csv file

TipsR_data <- read.csv("Example Data/TipsR.csv", na.strings = ".")

# to know the data were read correctly, we can use following strategies

# check the structure of the data
str(TipsR_data)

# check the missing values 
sum(is.na(TipsR_data))

# identify which columns contain missing values 
colSums(is.na(TipsR_data))
