#Blair Rajamaki 08/11/2019 Exercise 2 using Regression and Model Validation.

#Data Wrangling

#Importing the data into R
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
#this was copied and pasted from Datacamp
 
# 2 getting familar with the data set:

# Exploring the dimensions of the data
dim(lrn14) 
#60 variables, 183 observations

#Summary of the data
summary(lrn14)
#Structure of the data
str(lrn14)

#Here is a link to the full learning2014 data:
[Link to the full dataset](https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt)
#most variables appear to be in a likart scale (1-5). Other varibles are demogrpahic (Age= postive intergers, gender=dicotmous varible F and M)
#Other varibles include Attitude = Global attitude toward statistics ~Da+Db+Dc+Dd+De+Df+Dg+Dh+Di+Dj and Points = exam points 0-33



#3 Creating an analysis dataset:

library(dplyr)

#how Attitude is defined
lrn14 <- lrn14 %>% mutate(Asenne=Da+Db+Dc+Dd+De+Df+Dg+Dh+Di+Dj)
plot(lrn14$Attitude,lrn14$Asenne)



#grouping variables
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

#Deep
# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
#creating row means for deep_columns
lrn14$deep <- rowMeans(deep_columns)

#Surface
# columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
#creating row means for surface_columns
lrn14$surf <- rowMeans(surface_columns)

#Strategic
# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
# creating row means for strategic_columns
lrn14$stra <- rowMeans(strategic_columns)

#SCALING the Attitude variable
lrn14$Attitude
lrn14$Attitude / 10
#creating a new scaled varible called "attitude"
lrn14$attitude <- lrn14$Attitude / 10

#POINTS variable changes
# Check the distribution of exam points by creating a histogram
hist(lrn14$Points)
#there are several "=" results, but otherwise it looks normaly distributed
#Excluding observastions the ="0" in points variable
lrn14 <- filter(lrn14, Points > 0)

#New dataset called "learning2014"
#first choose the columns I want to keep
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")
#SELECT the "keep_columns" to create my new dataset
learning2014 <- select(lrn14, one_of(keep_columns))
#Check out the structure of the new dataset "learning2014.
str(learning2014)

#4
# Change working directory to IODS-folder
#setwd("~/IODS-project")
setwd("D:\\IODS-project\\")
#Save the analysis dataset to the 'data' folder
write.table(learning2014,file="D:\\IODS-project\\IODS-project\\Data\\learning2014.csv")

#How to read the data back to R and check the structure to see if observations look the same
# install.packages ("readx1")
library(readx1)

#demostration on how to read the data
readtest<- read.table("~/IODS-project/data/learning2014.csv")

str(learning2014)
str(readtest)

head(learning2014)
head(readtest)

#I have made changes to lrn14 (filtered out the '0's of points, OH NO!)
#May need to redownload the data
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)