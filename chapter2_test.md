---
title: "Blair's awesome notebook"
output:
  html_document:
    df_print: paged
  html_notebook: default
  pdf_document: default
---
# Chapter 2: Reading Data

learning2014<-read.table("D:\\IODS-project\\IODS-project\\Data\\learning2014.csv")

#Description of the data set:
```
str(learning2014)
```
**N=166** with *7 variables (gender, age, attitude, deep, stra, surf and points.* 

**Gender** is a a dicotious variable meaning it can have either female ("F"= female) or male ("M"= male). 

**Age** is a continous variable with positive numbers. 
**Attitude** is based off of the "global attitude towards statistics". 

**Deep**, **stra** (structure), **surf** (surface) are variables based on the *mean* of likert scores (1-5) to clustered questions.

**Points** represent the exam points.

#Graphical display of the data:

#From DataCamp
```{r}
pairs(learning2014[-1], col = learning2014$gender)
```

##WRITE info about the table##
3Show a graphical overview of the data and show summaries of the variables in the data. Describe and interpret the outputs, commenting on the distributions of the variables and the relationships between them. (0-3 points)

#Regression Model:
Choose three variables as explanatory variables and fit a regression model where exam points is the target (dependent) variable. Show a summary of the fitted model and comment and interpret the results. Explain and interpret the statistical test related to the model parameters. If an explanatory variable in your model does not have a statistically significant relationship with the target variable, remove the variable from the model and fit the model again without it. (0-4 points)

#Summary of fitted plot:
Using a summary of your fitted model, explain the relationship between the chosen explanatory variables and the target variable (interpret the model parameters). Explain and interpret the multiple R squared of the model. (0-3 points)

#Diagnostic plots:
Produce the following diagnostic plots: Residuals vs Fitted values, Normal QQ-plot and Residuals vs Leverage. Explain the assumptions of the model and interpret the validity of those assumptions based on the diagnostic plots. (0-3 points)
```

```
Residual vs fitted plot tests the assumptions of wether the relationship between the predictor variables and outcome variable are linear and whether there is equal variance along the regression line.

Normal QQ-plot is a differnt type of scatter plot that looks at the distibution of the dependent and indepedent variable. If they are similarly normally distributed the dots of the plot should roughly form a line. If the distributions are not normally distributed the dots will take on a different shape (i.e. curved)

Residuals vs Leverage plot helps to identify influential data points on the model, such as outliers, . 


