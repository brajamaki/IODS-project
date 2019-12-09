
#BPRS data
# 1. Loading in the data sets in wide form:
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
save ( BPRS, file = "IODS-project/Data/BPRS.csv")

str(BPRS)
#40 observations, 11 variables, appears to be repeated measurments each week
summary (BPRS)
#treatment= dichotimous
#subject= numbered 1 through 20
#Week #= apears to be score 1-100, and each week the median decreases

#need to change format from Wide to long
library(dplyr)
library(tidyr)

# 2. Factor treatment & subject
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)

# 3. Covert the datasets to long form
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)

# Extract the week number
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))
glimpse(BPRSL)

# 4. Comparing the different data sets
glimpse (BPRS)
# 40 observations and 11 variables; wide form = When you think ‘wide’, think 'horizontal’
glimpse (BPRSL)
# 360 observations and 5 variables; long form = When you think 'long', think vertical
# In wide format, categorical data is always grouped. You can think of it as a summary of long data. It is easier to read and interpret as compared to long format.
# In long vertical format, every row represents an observation belonging to a particular category.
save ( BPRSL, file = "IODS-project/Data/BPRSL.csv")

#RATS data
# 1. Loading in the data sets in wide form:
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE, sep = '\t')

save( RATS, file = "IODS-project/Data/RATS.csv" )
str (RATS)
# 16 observations 13 variables.
summary (RATS)
#ID= numbered 1 though 16
#Group = 3 different groups
#WD#= appears to be increasing over time on some sort of scale

#need to change format from Wide to long
library(dplyr)
library(tidyr)

# 2. Factor variables ID and Group
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)
glimpse(RATS)

# 3. Convert data to long form
RATSL <- RATS %>% gather(key = WD, value = Weight, -ID, -Group) %>% mutate(Time = as.integer(substr(WD,3,4))) 

glimpse (RATSL)


# 4. Comparing the different data sets
glimpse (RATS)
# 16 observations and 13 variables;  wide form = When you think ‘wide’, think 'horizontal’
glimpse (RATSL)
# 175 observations and 5 variables; long form = When you think 'long', think vertical

# In wide format, categorical data is always grouped. You can think of it as a summary of long data. It is easier to read and interpret as compared to long format.
# In long vertical format, every row represents an observation belonging to a particular category.
save ( RATSL, file = "IODS-project/Data/RATSL.csv")
