# Design and Deploy Forecasting Model

This project served as the Summative Assessment for module "Basic R Programming" of Professional Diploma in Data Science of Lithan Academy.

## Project Overview
For this project the mtcars dataset was used for the study. These data were derived car manufacturer information published by the Department of Transport. In this project, linear regression model was utilized in both R program and Azure Machine Learning (AML) environment for predicting miles per gallon (mpg) of automobiles.

## Objectives of the Project
The following are the objectives of the project:
1.	Develop an R-script using RStudio to create a linear model to forecast the mpg of automobiles
2.	Perform the same activities on Microsoft Azure Machine Learning Studio

## Project Outline
To start the project in R program, those required libraries such as ggplot2, corrplot shall be installed and the mtcars dataset shall be loaded into R program. Subsequently, the structure and datatypes of the dataset shall be checked. For some columns which were of integer type originally, they were converted into categorical type (as factor) for more appropriate data handling. In the next step, exploratory data analysis (EDA) was performed to study the relationship of each independent variable with the dependent variable.

For those assumptions which shall be satisfied when using linear regression model, such as linear relationship between dependent and independent variables, no multicollinearity between independent variables, normality of residuals, were also checked for proper implementation of the linear regression model. The base linear regression model was then built and the R-squared and adjusted R-squared of the linear regression model were then used to evaluate the performance of the model. Since this was a multiple linear regression model, adjusted R-squared was the more appropriate metric to use. To further improve the base model, additional studies (whether to drop outliers, threshold for correlation) were done during the reverse engineering stage to find the best fit model.

In addition to R program, the linear regression model was also built in AML. The main difference between building the linear regression model in R program and AML was that, in AML, it was possible to build the whole model without a single line of code. 

The following documents are provided in this repository:
  1. BRP-0322A-Lee Jack Shiang-Project-Report_latest.docx: Word document for the project report
  2. BRP-0322A-Lee Jack Shiang-Project.R: R codes for the project
  3. For optimising R and adjusted R.xlsx: Excel document for reverse engineering for finding the best fit model
  4. mtcars.csv: Dataset for the project
