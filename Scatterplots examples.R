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
#mapping continuous variable to color and size
#color and size represent the third aesthetic
heightweight %>% 
  select(sex,ageYear,heightIn,weightLb)

ggplot(heightweight,aes(x=ageYear,y=heightIn,color=weightLb))+
  geom_point()

ggplot(heightweight,aes(x=ageYear,y=heightIn,size=weightLb))+
  geom_point()

  
# -------------------------------------------------------------------------

#adding ftited regression models
#add stat_smooth() and tell it to use method=lm

hw_sp <- ggplot(heightweight,aes(x=ageYear,y=heightIn))

hw_sp +
  geom_point()+
  stat_smooth(method = lm)

#stat_smooth() adds a 95%confidence region for rgressiobn
#modify yhe region using level or disbale with se=FALSE
# 99%confidence region
hw_sp +
  geom_point()+
  stat_smooth(method = lm,level = 0.99)

#no confidence region
hw_sp +
  geom_point()+
  stat_smooth(method = lm, se=FALSE)


# -------------------------------------------------------------------------

#adding annotations with model coefficients
model <- lm(heightIn~ageYear,heightweight)
summary(model)

# -------------------------------------------------------------------------
#labeling points in a scatter plot
#either use annotate or geom_texts()
#filter data to only look at 2009
countries_sub <- countries %>%
  filter(Year == 2009 & healthexp > 2000)

countries_sp <- ggplot(countries_sub,aes(x=healthexp,y=infmortality))+
  geom_point()

countries_sp+
  annotate("text",x=4350,y=5.4,label="Canada")+
  annotate("text", x = 7400, y = 6.8, label = "USA")

# -------------------------------------------------------------------------

#add automatically all countries
library(ggrepel) #label to avoid overlapping

countries_sp +
  geom_text(aes(label = Name), size = 3)

countries_sp+
  geom_text_repel(aes(label=Name),size=3)


countries_sp+
  geom_label_repel(aes(label=Name),size=3) #geom_label_repel adds box


# -------------------------------------------------------------------------

#making  scatterplot matrix

c2009 <- countries %>%
  filter(Year == 2009) %>%
  select(Name, GDP, laborrate, healthexp, infmortality)

c2009_num <- select(c2009, -Name)
pairs(c2009_num) #pairwise dta visualization

































