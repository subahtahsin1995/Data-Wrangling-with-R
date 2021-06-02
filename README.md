# Data-Wrangling-with-R
Instructions:

Section I. Combining datasets:
You are given the sales data files for years 2014-16 in CSV format.
Read in the 3 data files in R.
Combine into a single table, keeping only the following 8 variables: "id", "sale", "units", "rating", "product", "industry", "country", "return.client". All other variables should be removed.

Section II. Examining the dataset:
Let’s get a sense of how our data is structured. Use the str( ) function to examine the dimensions and data types. 
How many observations and variables are we working with? 
Make sure variables are in a data type that makes sense. Convert them if necessary (i.e., categorical variables as factor type, continuous variables as numeric).

Section III. Recoding values:
Use levels( ) function on the “country” variable to examine its unique values. 
Notice there’s a data entry error for “Switzerland, Switzerland”. Correct the mistake by changing it to “Switzerland”.
We only want to keep “Switzerland”, “United States”, and “United Kingdom” as values. Recode the other values as “other”. [hint: consider using %in% and ! operators]
Check the levels for the “industry” variable. 
We are told that values of 999 were entered to indicate a missing value. Convert those to NA values.
Section IV. Handling missing values:
Find out how many missing values (NA) are present for each variable. Optional hint: Consider using a for loop to reduce redundancy.
For the “product” variable, we are told missing values were actually supposed to be “Delta” products. Change those NA values to “Delta”.
Remove all observations with missing values. How many observations still remain? 

Section V. Creating variables:  
For each client transaction (row), we are interested in how much was sold per unit.
Create a new variable “sale_per_unit”, calculated as “sale” divided by “units” for each observation.
The “rating” variable expresses the client’s satisfaction with the company’s service. We want to categorize these values into 3 groups: “excellent”, “satisfactory”, and “poor”.
Create a new categorical variable “rating_level” that bins the “rating” values into:
“excellent” for rating values 5 and above.
“satisfactory” for rating values between 4 and 5.
“poor” for rating values 4 or less.
The company wants to identify returning clients that were not satisfied with the current transaction. They are considered valuable customers at risk of being lost. 
Create a “priority” variable to identify these clients. The variable should have a value of 1 if both “return.client”=1 and “rating.level”=”poor” to indicate returning dissatisfied customers, or a value of 0 if those conditions are not true.

Section VI. Export dataset:
Export the dataset to a CSV file. The filename should be lastname_firstname.csv (for example, “terng_charlie.csv”).
Note: If you see an additional column in your file for the row index number, remove it with the “row.names” parameter in the write.csv( ) function.
