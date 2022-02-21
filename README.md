# InsurancePricing-Linear-Regression
Medical Expenses Prediction by using Linear Regression

OBJECTIVE:

The goal of this project is to create an estimate of the future average medical care expenses using regression for provided population segments.
This will help medical insurance company to decide the future premium charge .


 <img src="https://user-images.githubusercontent.com/99994988/154972826-a6bf642d-dfbd-40b5-8c5c-dbccc075d2b3.png" width="700" height="300" align="center">
 
 EXPLORING VARIABLES:
 
 <img src="https://user-images.githubusercontent.com/99994988/154973430-ecd1099f-fd63-4fa2-b891-2e874a93497d.png" width="400" height="300" align="right">
 
 <img src="https://user-images.githubusercontent.com/99994988/154974035-73495b6d-5bc6-4f35-91cc-a7f3574ffe31.png" width="400" height="300" align="centre">
 
 <img src="https://user-images.githubusercontent.com/99994988/154973820-60cd13ef-e5ec-4013-a965-2fdac17545b7.png" width="400" height="300" align="right">
 
 <img src="https://user-images.githubusercontent.com/99994988/154974951-d563ea78-c06d-47b2-a059-dd97f7675221.png" width="400" height="300" align="centre">
 
 
 
 
 
 LINEAR REGRESSION MODEL:
 
 MODEL 1 WITH ALL THE VARIABLES : R SQUARED OF 75%
 
 MODEL 2 WITHOUT THE VARIABLE "SEX" AS IT IS NOT SIGNIFICANT IN MODEL 1: R SQUARED OF 79.74%
 
 MODEL 3 WITHOUT THE VARIABLE "SEX" AND "REGION" AND WITH "BMI* SMOKER" : R SQUARED OF 86%
 
 CONCLUSION:
 
 R square has increased to 86% by adding bmi30* smoker_yes and removing region and the residuals has decreased to 4514. 
 Therefore, MODEL 3 seems to be more significant than Model 1 and Model2.

RESIDUAL ANALYSIS shows there is a pattern in errors and clustered in grps.It has be further investigated if we need to do different prediction on the basis of smoker and non smoker.
 
 
 
 
 
 


