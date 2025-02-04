# This is a comment

#### This is a section ####

#####

# X is not equal to x

#### Exercise number 1 ####
# R is a big calculator

2+2
2-2
2/2
2*2

#### Exercise number 2 ####

#Objects 

x <- 2
y = 3

x + y

x - y

x * y

x / y

# This is a character variable. 

name <- "Vaibhav"
seven <- "7"

x + seven

class(seven)
class(x)


#Concatinate function 
vec <- c(1, 2, 3, 4, 5, 6, 7)
vec1 <- c(1:7)
vec <- 1:7
vec2 <- c("Vaibhav", "Carson", "Archie")
vec3 <- c(TRUE, FALSE, TRUE)


vec2[2]

vec + 2

# Basic functions in R
vec
mean(vec)
sd(vec)
sum(vec)
median(vec)
min(vec)
max(vec)
summary(vec)
abs(vec)
sqrt(vec)
sqrt(sum(vec))
log(vec)     #natural log
log10(vec)
exp(vec)


### Logical operators
# > greater than 
# < less than 
# | or
# & and
# = equals (used to assign values from the left to right)
# == exactly equal to (used for showing equality between values)
# >= greater than or equal to 
# != not equal to. 

1 > 2
1 < 2
1 <= 2
1 == 1  #asking is 1 equal to 1 

t <- 1:10

# Values of t such that t is greater than 8 or less than 5
t[(t > 8) | (t<5)]

# Values of t such that t is greater than 8 and less than 10
t[(t > 8) & (t < 10)]

# elements of the t that are not exactly equals to 2 
t[t != 2]


# ask R if a number exists in a vector
32 %in% t

## Data types
# Scalar objects 
x
# Vectors
t

# matrix

#Example of a numeric matrix
mat1 <- matrix(data = c(1, 2, 3), nrows = 3, ncol = 3)

# Character matrix 
mat2 <- matrix(data = c("Vaibhav", "Carson", "Archie"), nrow = 3, ncol = 3)

mat1[1]
mat1[2]
mat1[3]
mat1[4]
mat1[9]

mat1[1,3] #first row, third column
mat1[1,]
mat1[,3]

# Dataframes
# Dataframes are basically like matrices but with multiple data classes or data types (i.e., logical or numeric)

df <- data.frame(mat1[,1], mat2[,1])
df

colnames(df) <- c("value", "name")

df[1,2]  #First row second column
df[, "value"]

df$value # accessing columns

df$value[1]
df$name[3]

# Subsetting or indexing 

# the element of the column such that names is equal to Carson
df$value[df$name == "Carson"]

# return the elements of the column value within the dataframe df such that name is not equal to Vaibhav and Carson
df$value[df$name == c("Vaibhav", "Carson")]

# Subset function
subset(df, name == "Vaibhav")

# making a new column in dataframe
df$log_value <- log (df$value)
df

# Installing packages
# tidyverse
# lme4
# purrr

install.packages("tidyverse") # install the package from CRAN repository

install.packages("phyloseq")

library(tidyverse) # loads the functions into R 


### Reading data into R 
# CSV or TXT 

CSV <- read.csv("/C/Users/vshel/Downloads/Book2.csv")

csv2 <- file.choose("/C/Users/vshel/Downloads/Book2.csv")







































































