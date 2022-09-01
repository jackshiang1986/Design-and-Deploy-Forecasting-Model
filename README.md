# Design and Deploy Forecasting Model

## Project Overview
For this project the mtcars dataset will be used for the study. The data of mtcars is contained in a csv file. These data are derived car manufacturer information published by the Department of Transport. In this project, linear regression model will be utilized in both R program and Azure Machine Learning (AML) environment. The mtcars dataset contains 32 observations (rows) and 11 variables (columns), and the mpg is the dependent (target) variable for this project.

## Objectives of the Project
The following are the objectives of the project:
1.	Develop an R-script using RStudio to create a linear model to forecast the mpg of automobiles
2.	Perform the same activities on Microsoft Azure Machine Learning Studio

## Project Outline
To start the project in R program, those required libraries such as ggplot2, corrplot shall be installed and the mtcars dataset shall be loaded into R program. Subsequently, the structure and datatypes of the dataset shall be checked. For some columns which are of integer type originally, they are converted into categorical type for more appropriate data handling. In the next step, exploratory data analysis (EDA) is performed to study the distribution of each variable and the relationship of each independent variable with the dependent variable.

For those assumptions which shall be satisfied for using linear regression model, such as linear relationship between dependent and independent variable, no multicollinearity between independent variables, normality of residuals, are also checked for proper implementation of the linear regression model. The base linear regression model is then built and the R-squared and adjusted R-squared of the linear regression model are then used to evaluate the performance of the model. Since this is a multiple linear regression model, adjusted R-squared is the more appropriate metric to use. To further improve the base model, additional studies (whether to drop outliers, threshold for correlation) are done during the reverse engineering stage to fit the best fit model.

In addition to R program, the linear regression model is also built in AML. The main difference between building the linear regression model in R program and AML is that, in AML, it is possible to build the whole model without a single line of code. 

The following documents are provided in this repository:
  1. BRP-0322A-Lee Jack Shiang-Project-Report_latest.docx: Word document for the project report
  2. BRP-0322A-Lee Jack Shiang-Project.R: R codes for the project
  3. For optimising R and adjusted R.xlsx: Excel document for reverse engineering for finding the best fit model
  4. mtcars.csv: Dataset for the project
