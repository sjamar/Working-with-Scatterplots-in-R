#loading packages
library(tidyverse)
library(gcookbook) #contains the dataset used
#scatterplots display relationship btn two continous
#variables
#each observation in a data is marked by a point

# -------------------------------------------------------------------------

heightweight %>% 
  select(ageYear,heightIn)

ggplot(heightweight,aes(x=ageYear,y=heightIn))+
  geom_point()  

# -------------------------------------------------------------------------

#instead of points you can use shape aesthetic
ggplot(heightweight,aes(x=ageYear,y=heightIn))+
  geom_point(shape=21)

# -------------------------------------------------------------------------

#grouping points together using shapes and color
 heightweight %>% 
  select(sex,ageYear,heightIn)
ggplot(heightweight,aes(x=ageYear,y=heightIn,color=sex))+
  geom_point()
#you can change shape of points
ggplot(heightweight,aes(x=ageYear,y=heightIn,shape=sex,color=sex))+
  geom_point()
  

# -------------------------------------------------------------------------
#mapping continous variable to color and size
#color and size represent the third aesthetic
heightweight %>% 
  select(sex,ageYear,heightIn,weightLb)

ggplot(heightweight,aes(x=ageYear,y=heightIn,color=weightLb))+
  geom_point()

ggplot(heightweight,aes(x=ageYear,y=heightIn,size=weightLb))+
  geom_point()

  
  
  
  
  














