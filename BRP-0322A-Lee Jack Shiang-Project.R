##############################################################################################################
# Activity 1: Define	data	management	structures	to	align	and	streamline	processes	of	data	ownership, #	
#             retrieval,	combination and	usage                                                              #
##############################################################################################################
# Question 1
# Explain	the	process	of	the	data flow	,	retrieval	,	combination	of	both	R	and	AML	and	its	usage
# Please refer to the submitted MS Word Project Report


###################################################################################
# Activity 2: Create R code for effective	 data loading,	storage	and	utilization #
###################################################################################
# Question 1
# Install	packages	ggplot2,	car,	caret,	corrplot	and	use	library	to	use	them
install.packages("ggplot2")
install.packages("car")
install.packages("caret")
install.packages("corrplot")

# Check the installation
installed.packages("ggplot2")
installed.packages("car")
installed.packages("caret")
installed.packages("corrplot")

# Load the required libraries
library("ggplot2")
library("car")
library("caret")
library("corrplot")

# Question 2
# Load	the	MTCARS	file	from	the	R	studio	default	dataset
# Note: We are loading the csv file provided by the mentor as suggested in class
mtcars <- read.csv("C:/Users/jacks/Desktop/Lithan/Courses/NICF-Basic R Programming(SF)/Project/Report Template and dataset/mtcars.csv")
dim(mtcars)

# Note: This step is to remove outliers w.r.t mpg after some EDA (reverse engineering)
# Removing outliers may help to improve the model
mtcars <- mtcars[mtcars$mpg > 0 & mtcars$mpg < 32, ]   # Removing outliers for mpg
dim(mtcars)

# Question 3
# Understand	the	dataset	by	using	standard	function	str	,	head	and	summary
# - str : shows the structure of the data
str(mtcars)
# - head : shows first 6 rows of dataset by default
head(mtcars)
# - tail : shows last 6 rows of dataset by default
tail(mtcars)
# - summary : shows the descriptive statistics of the dataset
summary(mtcars)

# Question 4
# Mention	the	number of	records	and	fields from MTCARS	in	your	project	report
print(dim(mtcars))
# 30 observations (rows) and 11 variables (columns)

# unique function is used to check unique values of column
unique(mtcars$am)
unique(mtcars$cyl)
unique(mtcars$vs)
unique(mtcars$gear)


################################################################
# Activity 3: Perform data	handling	standards	and	procedures #
################################################################
# Question 1
# Factorise	am,	cyl,	vs	and	gear	fields
mtcars$am <- as.factor(mtcars$am)
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$gear <- as.factor(mtcars$gear)

str(mtcars)

# Question 2
# Dropping	dependent	variable	for	calculating	Multicollinearity(mpg)
x <- mtcars[,c(-1)]  # Independent variable columns 
y <- mtcars$mpg  # Dependent variable column

# Question 3
# Display	the	new	data	and	check	if	mpg	is	displayed	or	not
str(x)
str(y)
x  


#############################################
# Extra Activity: Exploratory Data Analysis #
#############################################
# To plot out the charts for dependent variable against each independent variable, and find out any insights
# in them (any outliers, trend, etc)
# Independent variable x: "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear" "carb"
# Dependent variable y: "mpg"


# Check distribution (histogram) of the dependent variable mpg
# Using normal plot
plot(mtcars$mpg)
# Using ggplot
ggplot(data = mtcars, aes(x = mpg)) + geom_histogram(bins = 10) +
  labs(title="Histogram for mpg", subtitle="From mtcars dataset", x="mpg", caption="Mtcars Demographics")

# Use boxplot to quickly check if any outliers for mpg values
ggplot(data = mtcars, aes(mpg,mpg)) + geom_boxplot()
# Looks like majority of the mpg values fall between 0 to 32 and some outliers there
# In this case only rows with mpg > 0 and mpg < 32 will be considered in reverse engineering stage and
# outliers outside of that range will be deleted


# For mpg vs cyl
# Using normal plot
plot(x$cyl,y)
# Using ggplot
ggplot(data = x, aes(x = cyl, y = y)) + geom_boxplot() +
  labs(title="mpg Vs cyl", subtitle="From mtcars dataset", y="mpg", x="cyl", caption="Mtcars Demographics")
# Output chart type: boxplot
# Any outliers? yes
# Any insights? median value of mpg decreases with increasing cyl


# For mpg vs disp
# Using normal plot
plot(x$disp,y)
# Using ggplot
ggplot(data = x, aes(x = disp, y = y)) + geom_point() + geom_smooth(method = "lm") + 
  labs(title="mpg Vs disp", subtitle="From mtcars dataset", y="mpg", x="disp", caption="Mtcars Demographics")
# Output chart type: scatter plot
# Any outliers? not so obvious
# Any insights? mpg decreases with increasing disp


# For mpg vs hp
# Using normal plot
plot(x$hp,y)
# Using ggplot
ggplot(data = x, aes(x = hp, y = y)) + geom_point() + geom_smooth(method = "lm") + 
  labs(title="mpg Vs hp", subtitle="From mtcars dataset", y="mpg", x="hp", caption="Mtcars Demographics")
# Output chart type: scatter plot
# Any outliers? not so obvious
# Any insights? mpg decreases with increasing hp


# For mpg vs drat
# Using normal plot
plot(x$drat,y)
# Using ggplot
ggplot(data = x, aes(x = drat, y = y)) + geom_point() + geom_smooth(method = "lm") +
  labs(title="mpg Vs drat", subtitle="From mtcars dataset", y="mpg", x="drat", caption="Mtcars Demographics")
# Output chart type: scatter plot
# Any outliers? not so obvious
# Any insights? mpg increases with increasing drat


# For mpg vs wt
# Using normal plot
plot(x$wt,y)
# Using ggplot
ggplot(data = x, aes(x = wt, y = y)) + geom_point() + geom_smooth(method = "lm") +
  labs(title="mpg Vs wt", subtitle="From mtcars dataset", y="mpg", x="wt", caption="Mtcars Demographics")
# Output chart type: scatter plot
# Any outliers? not obvious
# Any insights? mpg decreases with increasing wt


# For mpg vs qsec
# Using normal plot
plot(x$qsec,y)
# Using ggplot
ggplot(data = x, aes(x = qsec, y = y)) + geom_point() + geom_smooth(method = "lm") +
  labs(title="mpg Vs qsec", subtitle="From mtcars dataset", y="mpg", x="qsec", caption="Mtcars Demographics")
# Output chart type: scatter plot
# Any outliers? not obvious
# Any insights? mpg increases with increasing qsec


# For mpg vs vs
# Using normal plot
plot(x$vs,y)
# Using ggplot
ggplot(data = x, aes(x = vs, y = y)) + geom_boxplot() +
  labs(title="mpg Vs vs", subtitle="From mtcars dataset", y="mpg", x="vs", caption="Mtcars Demographics")
# Output chart type: boxplot
# Any outliers? yes
# Any insights? median of mpg is higher for engine of straight type (vs = 1)
# vs	  Engine (0 = V-shaped, 1 = straight)


# For mpg vs am
# Using normal plot
plot(x$am,y)
# Using ggplot
ggplot(data = x, aes(x = am, y = y)) + geom_boxplot() +
  labs(title="mpg Vs am", subtitle="From mtcars dataset", y="mpg", x="am", caption="Mtcars Demographics")
# Output chart type: boxplot
# Any outliers? no
# Any insights? median of mpg is higher for manual type (am = 1)
# am	  Transmission (0 = automatic, 1 = manual)


# For mpg vs gear
# Using normal plot
plot(x$gear,y)
# Using ggplot
ggplot(data = x, aes(x = gear, y = y)) + geom_boxplot() +
  labs(title="mpg Vs gear", subtitle="From mtcars dataset", y="mpg", x="gear", caption="Mtcars Demographics")
# Output chart type: boxplot
# Any outliers? no
# Any insights? median of mpg is highest for 4 numbers of forward gears 


# For mpg vs carb
# Using normal plot
plot(x$carb,y)
# Using ggplot
ggplot(data = x, aes(x = carb, y = y)) + geom_point() + geom_smooth(method = "lm") +
  labs(title="mpg Vs carb", subtitle="From mtcars dataset", y="mpg", x="carb", caption="Mtcars Demographics")
# Output chart type: scatter plot
# Any outliers? not so obvious
# Any insights? mpg decreases with increasing carb


#############################################
# Activity 4: Identifying	numeric	variables #
#############################################
# Question 1
# Identifying	numeric	variables using	apply	function	and	display
x_numeric_var <- x[,sapply(x,is.numeric)]
x_numeric_var

# Question 2
# Write	down	in	your	project	report	all	the	numeric	fields
colnames(x_numeric_var)


########################################################################################################
# Activity	5:	Data	management	tools	/	standards	for	Correlation	Matrix	and Correlated	attributes #
########################################################################################################
# Question 1
# Calculating	Correlation
x_mat_cor <- cor(x_numeric_var)

# Question 2
# Print	correlation	matrix	and	look	at	max	correlation
print(x_mat_cor)

# Question 3
# Visualize	Correlation	Matrix
corrplot(x_mat_cor,method = 'color',addCoef.col = 'black', type = 'lower', diag = FALSE)

# Reference website for corrplot():
# https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html

# Question 4
# Identifying	Variable	Names	of	Highly	Correlated	Variables
# wt vs disp (Consider the cutoff threshold for high correlation is 0.8)

# Question 5
# Print	highly	correlated	attributes
print(head(mtcars[,c("disp","wt")]))

# Question 6
# Write	down	in	your	project	report	all	the	highly correlated	attributes
print(head(mtcars[,c("disp","wt")]))


# Question 7
# Remove	highly	correlated	variables	and	create	a	new	dataset
Threshold <- 0.8
x_high_corr_cutoff <- findCorrelation(x_mat_cor,cutoff = Threshold)
x_high_corr_cutoff

x_high_corr_column_names <- colnames(x_numeric_var)[x_high_corr_cutoff]
print(x_high_corr_column_names)

x_new <- x_numeric_var[ , -which(colnames(x_numeric_var) %in% x_high_corr_column_names)] # Only numerical variables are considered (from reverse engineering)
x_new <- x_new[,-c(4,5)] # drop features with highest P value (start from highest): "carb" "qsec" (from reverse engineering)
x_new

# Question 8
# Write	down	in	your	project	report	the dimensions	of	new	dataset
str(x_new)
dim(x_new)


########################################
# Activity	6:	Propose	Model	Creation #
########################################
# Question 1
# Build	Linear	Regression	Model
# Best fitted model obtained thru reverse engineering
model <- lm(y ~ ., data = x_new)

# Question 2
# Check	Model	Performance using	summary	
summary(model)

# Question 3
# Extracting	Coefficients using	summary	
summary(model)$coefficients

# Question 4
# Take	screenshot	of	summary	coeff	
# Please refer to the submitted MS Word Project Report


#############################
# Activity	7:	Plot	model #
#############################
# Question 1
# Plot	the	fit	model	in	a	2*2	matrix	using	par	
par(mfrow = c(2,2))
plot(model)

# Question 2
# Take	screenshot	of	 fit
model$fitted.values

# Question 3
# Mention	the	R	squared	in	the	Project	report	
summary(model)$r.squared
summary(model)$adj.r.squared


######################################################################################################################
# Activity	8:	Establish	internal	processes	to	Calculating	Model	Performance ,monitor	compliance	of	data	with #	
#               relevant metrics procedure                                                                           #
######################################################################################################################
# Question 1
# Extracting	R-squared	value
r_squared <- summary(model)$r.squared
r_squared


# Question 2
# Extracting	Adjusted	R-squared	value
adjusted_r_squared <- summary(model)$adj.r.squared
adjusted_r_squared


# Question 3
# Mention	the	above	values in	the	Project	report	
# Please refer to the submitted MS Word Project Report


#############################
# Activity	9:	Predict	mpg #
#############################
# NOTE: As informed by the lecturer for this project the train test split in R will not be done as
# this is a beginner course and the data set is too small for the split and the model may not be trained properly
# However in the real world data set the train test split shall always be done

# Question 1
# Use function	predict	for	the	fit	and	dataframe	from	activity 5	
predictions <- round(predict(model,x_new),1)

# Question 2
# Use	cbind	to	combine	original	mtcars	and	predicted	values	
mtcars_pred <- cbind(mtcars,predictions)

# Question 3
# Print	both	actual	and	predicted	mpg	
print(mtcars_pred[,c("mpg","predictions")])

# Plot actual vs predicted mpg
ggplot(data = mtcars_pred, aes(x = mpg, y = predictions)) + geom_point() +
  labs(title="Actual Vs Predicted mpg", subtitle="Best Fitted Model", x="Actual", y="Predicted",  caption="Mtcars Demographics")

# Plot actual mpg vs each selected feature (hp, drat, wt)

# Plot actual mpg vs hp
ggplot(data = mtcars_pred, aes(x = hp, y = mpg)) + geom_point() + geom_smooth(method = "lm") +
  labs(title="mpg vs hp", subtitle="Best Fitted Line", x="hp", y="mpg",  caption="Mtcars Demographics")

# Plot actual mpg vs drat
ggplot(data = mtcars_pred, aes(x = drat, y = mpg)) + geom_point() + geom_smooth(method = "lm") +
  labs(title="mpg vs drat", subtitle="Best Fitted Line", x="drat", y="mpg",  caption="Mtcars Demographics")

# Plot actual mpg vs wt
ggplot(data = mtcars_pred, aes(x = wt, y = mpg)) + geom_point() + geom_smooth(method = "lm") +
  labs(title="mpg vs wt", subtitle="Best Fitted Line", x="wt", y="mpg",  caption="Mtcars Demographics")


# Calculate the residuals
mtcars_pred$residuals <- mtcars_pred$mpg - mtcars_pred$predictions
print(mtcars_pred[,c("mpg","predictions","residuals")])

# Plot the histogram of residuals
ggplot(data = mtcars_pred, aes(x = residuals)) + geom_histogram(bins = 5) +
  labs(title="Histogram for residuals", subtitle="Best Fitted Model", x="residuals", caption="Mtcars Demographics")

# Calculate the RMSE (using RMSE() from caret)
rmse <- RMSE(pred = mtcars_pred$predictions ,obs = mtcars_pred$mpg)
print(rmse)

# Or it can be calculated just based on RMSE formula
rmse <- sqrt(mean((mtcars_pred$mpg - mtcars_pred$predictions)^2))
print(rmse)


#################################################################################################################
# Activity	10:	AML rules	and	guidelines	to	ensure	proper adoption	and	adhernece of	same	R	program	in	AML #
#################################################################################################################
# Please refer to the submitted MS Word Project Report





###########################################
# Reference Codes For Reverse Engineering #
###########################################
# NOTE: In this section the reference codes are provided for reverse engineering
# For reverse engineering the following aspects are considered:
# 1. Whether to remove the outliers w.r.t mpg discovered during EDA
# 2. Whether to consider both categorical and numerical variables or only numerical variables in the linear model
# 3. Threshold values (0.71 or 0.80) considered for high correlation
# 4. Whether to drop variables with high p values

# Codes below are for reverse engineering process in order to find the best fitted model


# Check R squared and adjusted R squared at various Thresholds: 0.71, 0.8
# Both Numerical and Categorical variables are considered
# Outliers w.r.t mpg not removed / removed
Threshold <- 0.8
x_high_corr_cutoff <- findCorrelation(x_mat_cor,cutoff = Threshold)
x_high_corr_cutoff

x_high_corr_column_names <- colnames(x_numeric_var)[x_high_corr_cutoff]
x_high_corr_column_names

x_new <- x[,-which(colnames(x) %in% x_high_corr_column_names)] # Both Numerical and Categorical variables are considered

model <- lm(y ~ ., data = x_new)
# One hot encoding for dealing with categorical variables

r_squared <- summary(model)$r.squared
adjusted_r_squared <- summary(model)$adj.r.squared
coefficients_and_p_value <- summary(model)$coefficients

print(paste("At Threshold = ",Threshold,"(+ve or -ve)"))
print(paste("R-Squared = ",r_squared))
print(paste("Adjusted R-Squared = ",adjusted_r_squared))
print(coefficients_and_p_value) 


# Check R squared and adjusted R squared at various Thresholds: 0.71, 0.8
# Only Numerical variables are considered                    
# Outliers w.r.t mpg not removed / removed
Threshold <- 0.8
x_high_corr_cutoff <- findCorrelation(x_mat_cor,cutoff = Threshold)
x_high_corr_cutoff

x_high_corr_column_names <- colnames(x_numeric_var)[x_high_corr_cutoff]
x_high_corr_column_names

x_new <- x_numeric_var[ , -which(colnames(x_numeric_var) %in% x_high_corr_column_names)] # Only numerical variables are considered

model <- lm(y ~ ., data = x_new)

r_squared <- summary(model)$r.squared
adjusted_r_squared <- summary(model)$adj.r.squared
coefficients_and_p_value <- summary(model)$coefficients

print(paste("At Threshold = ",Threshold,"(+ve or -ve)"))
print(paste("R-Squared = ",r_squared))
print(paste("Adjusted R-Squared = ",adjusted_r_squared)) 
print(coefficients_and_p_value) 

# From the above reverse engineering based on column selection (multicollinearity, type of data), row selection (removing outliers),
# the best adjusted R2 (0.836230818422368) is found when:		
# Outliers w.r.t mpg are removed		
# Threshold for the cutoff value considered for high correlation columns is at 0.8		
# Only numerical columns are considered for the feature variables		


# Further study for the model obtained above:
# Try removing some feature variables with high P values to see if any improvement to adjusted R2
# Some variables with high P values (in descending order): carb, qsec, drat (cannot be further reduced after dropping drat)
Threshold <- 0.8
x_high_corr_cutoff <- findCorrelation(x_mat_cor,cutoff = Threshold)
x_high_corr_cutoff

x_high_corr_column_names <- colnames(x_numeric_var)[x_high_corr_cutoff]
x_high_corr_column_names

x_new <- x_numeric_var[ , -which(colnames(x_numeric_var) %in% x_high_corr_column_names)] # Only numerical variables are considered
x_new <- x_new[,-c(4,5)] # drop features with highest P value (start from highest): "carb" "qsec"
x_new

model <- lm(y ~ ., data = x_new)

r_squared <- summary(model)$r.squared
adjusted_r_squared <- summary(model)$adj.r.squared
coefficients_and_p_value <- summary(model)$coefficients

print(paste("At Threshold = ",Threshold,"(+ve or -ve)"))
print(paste("R-Squared = ",r_squared))
print(paste("Adjusted R-Squared = ",adjusted_r_squared)) 
print(coefficients_and_p_value) 

# From the above it is found that the adjusted R2 can be further improved by dropping columns "carb" and "qsec"
# However the adjusted R2 value becomes worse off if "drat" (next feature with highest P value) is dropped
# Hence only "carb" and "qsec" will be dropped			
# Interesting note: Even though dropping drat will result in a worse Adjusted R2, but using this model about 84.1% of the variation
# of mpg can be explained by just 2 variables (hp and wt)!


# Based on above reverse engineering, the following best fitted model is selected:
# 1. Outliers w.r.t mpg are removed
# 2. Threshold for the cutoff value considered for high correlation columns is at 0.8
# 3. Only numerical columns are considered for the feature variables
# 4. "carb" and "qsec" columns are removed
# 5. The feature variables considered for the final model: "hp", "drat", "wt"
# 6. The adjusted R2 for the best fitted model: 0.845955723410979


#############################################################################################
#############################################################################################
#############################################################################################
# Note: Codes below are just for reference for checking which insignificant variables to be removed sequentially
# using drop1() for section above

Threshold <- 0.8
x_high_corr_cutoff <- findCorrelation(x_mat_cor,cutoff = Threshold)
x_high_corr_cutoff

x_high_corr_column_names <- colnames(x_numeric_var)[x_high_corr_cutoff]
x_high_corr_column_names

x_new <- x_numeric_var[ , -which(colnames(x_numeric_var) %in% x_high_corr_column_names)] # Only numerical variables are considered
x_new


model <- lm(y ~ ., data = x_new)
drop1(model,test = "F")

model<-update(model,~.-carb)
drop1(model,test = "F")

model<-update(model,~.-qsec)
drop1(model,test = "F")

model<-update(model,~.-drat)
drop1(model,test = "F")
# No more variable can be dropped since p values of hp and wt are already less than 0.05


#############################################################################################
#                                         APPENDIX                                          #
#############################################################################################

# Information for mtcars dataset 
# A data frame with 32 observations on 11 (numeric) variables.
# mpg	  Miles/(US) gallon
# cyl	  Number of cylinders
# disp	Displacement (cu.in.)
# hp	  Gross horsepower
# drat	Rear axle ratio
# wt	  Weight (1000 lbs)
# qsec	1/4 mile time
# vs	  Engine (0 = V-shaped, 1 = straight)
# am	  Transmission (0 = automatic, 1 = manual)
# gear	Number of forward gears
# carb	Number of carburetors


# Exploratory Data Analysis (EDA)
# Exploratory data analysis (EDA) is used by data scientists to analyze and investigate data sets and summarize their main
# characteristics, often employing data visualization methods. It helps determine how best to manipulate data sources to get
# the answers you need, making it easier for data scientists to discover patterns, spot anomalies, test a hypothesis, or check
# assumptions.
# The main purpose of EDA is to help look at data before making any assumptions.


# Some statistic definitions:

# Mean
# The mean (average) of a data set is found by adding all numbers in the data set and then dividing by the number of values in the set

# Median
# In statistics and probability theory, the median is the value separating the higher half from the lower half of
# a data sample, a population, or a probability distribution. For a data set, it may be thought of as "the middle" value. 

# First quartile
# The first quartile (Q1) is defined as the middle number between the smallest number (minimum)
# and the median of the data set. It is also known as the lower or 25th empirical quartile, as 25% of the data is below this point.

# Third quartile
# The third quartile (Q3) is the middle value between the median and the highest value (maximum) of the data set.
# It is known as the upper or 75th empirical quartile, as 75% of the data lies below this point.


# In statistics, multicollinearity (also collinearity) is a phenomenon in which one predictor variable in a multiple regression
# model can be linearly predicted from the others with a substantial degree of accuracy. In this situation, the coefficient
# estimates of the multiple regression may change erratically in response to small changes in the model or the data.
# Multicollinearity does not reduce the predictive power or reliability of the model as a whole, at least within the sample
# data set; it only affects calculations regarding individual predictors. That is, a multivariate regression model with collinear
# predictors can indicate how well the entire bundle of predictors predicts the outcome variable,
# but it may not give valid results about any individual predictor, or about which predictors are redundant with respect to others.

# Correlation is a statistical measure that indicates the extent to which two or more variables move together¹.
# A positive correlation indicates that the variables increase or decrease together. A negative correlation indicates
# that if one variable increases, the other decreases, and vice versa.
# The correlation coefficient indicates the strength of the linear relationship that might be existing between two variables.
# Also, when the correlation coefficient of the two variables is zero, it only indicates the absence of a 'linear'
# relationship between them and doesn't imply that the variables are independent.

