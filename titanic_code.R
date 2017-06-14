# Step 0: Load Titanic data

library(readr)
library(tidyr)
library(dplyr)

titanic_original <- read_csv("~/Documents/Eitan/R/Data Wrangling Exercises/Exercise 2/titanic_original.csv")

View(titanic_original)

# Step 1: Replace missing values with S in embarked column

titanic_original$embarked[is.na(titanic_original$embarked)] <- "S"

# Step 2: Calculate the mean of the age column and fill in the missing values with the mean.

x <- mean(titanic_original$age,na.rm = TRUE)
titanic_original$age[is.na(titanic_original$age)] <- x

# Step 3: Fill in the missing values in the boat column with NA

titanic_original$boat[is.na(titanic_original$boat)] <- "NA"

# Step 4-1: Does it make sense to fill in missing cabin numbers with a value? What does a missing value 
# mean? 

# Filling in the missing values would provide more information about the passengers in question.  
# Perhaps there is a relationship between the blank cabin cells and some other aspect of the data set.
# Even if those passengers didn't have a cabin it would be helpful to indicate that in the cabin column.

# Step 4-2: Create a column, "has_cabin_number". Fill each cell with 1 if the passenger had a cabin, and
# 0 if there was no cabin.

titanic_original <- mutate(titanic_original, has_cabin_number = ifelse(titanic_original$cabin == "", 0, 1))
titanic_original$has_cabin_number[is.na(titanic_original$has_cabin_number)] <- 0

# Step 6: Create clean file.

write.csv(titanic_original, "titanic_clean.csv")

