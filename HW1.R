#This displays the current working directory
getwd()
#This sets the working directory to the current path
setwd("C:/Users/Tamanna Tahsin/OneDrive/Desktop")
#This reads in the data
data1=read.csv("2014.csv")
data2=read.csv("2015.csv")
data3=read.csv("2016.csv")
#Dim shows the dimension of the data
dim(data1)
#This creates a vector of variables from the dataset
features=c("id","sale","units","rating","product","industry","country","return.client")
#Emty space for row/column means to retun all
data1=data1[,features]
names(data1)
data2=data2[,features]
data3=data3[,features]
#Rbind attaches all the data
data=rbind(data1,data2,data3)
dim(data)
#This shows information about variables
str(data)
#This as.factor function turns any character into a factor
data$id=as.factor(data$id)
data$industry=as.factor(data$industry)
data$product=as.factor(data$product)
data$country=as.factor(data$country)
#This as.numeric function turns any categorical value into a continuous
data$rating=as.numeric(data$rating)
data$sale=as.numeric(data$sale)
data$units=as.numeric(data$units)
data$return.client=as.factor(data$return.client)
levels(data$country)
#This converts country to character type
data$country=as.character(data$country)
#Here we are assigning a new value to switzerland, switzerland
data$country[data$country=="Switzerland, Switzerland"]= "Switzerland"
countries_to_keep=c("Switzerland","United States","United Kingdom")
#This selects rows in country that are not in the countries to keep list and change them to "other"
data$country[!(data$country %in% countries_to_keep)] = "other"
#This converts country back to factor
data$country = as.factor(data$country)
levels(data$country)
levels(data$industry)
data$industry=as.character(data$industry)
#This converts all the 999 values to NA
data$industry[data$industry=="999"]= "NA"
industries_to_keep=c("biotech", "environmental", "tech")
data$industry[!(data$industry %in% industries_to_keep)] = "NA"
data$industry=as.factor(data$industry)
levels(data$industry)
#This gives a total number of all the missing values
missing=is.na(data)
sum(missing)
#The loop shows the NA values by variable
for(i in names(data)){
  print(paste(i,":",sum(is.na(data[i])),sep=" "))
}
sum(is.na(data$product))
#This returns all NA row in products and changes them to Delta
data$product[is.na(data$product)==TRUE]="Delta"
sum(is.na(data$product))
#Na.omit() will remove the entire row with missing values
data=na.omit(data)
sum(is.na(data))
data$sale_per_unit=data$sale/data$units
summary(data$sale_per_unit)
#This creates new variable rating.level
data$rating.level=data$rating
data$rating.level[data$rating.level>=5]="excellent"
#The & symbol requires both conditions to be true
data$rating.level[data$rating<5 & data$rating.level>=4]="satisfactory"
data$rating.level[data$rating.level<4]="poor"
#This converts it back to factor
data$rating.level=as.factor(data$rating.level)
levels(data$rating.level)
data$priority=data$priority
data$priority[data$rating.level=="poor" & data$return.client==1]=1
data$priority[!data$rating.level=="poor"]=0
data$priority[data$return.client<1]=0
str(data)
#The write.csv() function exports all the data set as a csv to the current working directory which is getwd()
write.csv(data,"tahsin_tamanna.csv")
