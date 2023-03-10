#This Script analyzes the data in the ConstitutionalConventionDelegateInfo Excel Spreadsheet
#The data contains biographical and demographic information of the delegates
#This information will be graphically analyzed to look at patterns and correlations 
#But overall, the main goal of this script and data set is to showcase the cognitive diversity and inclusion of different 
#backgrgound and political preferences in the Convention 

#Read in the data + viewing the data 
library(readxl)
ConstitutionalConventionDelegateInfo <- read_excel("ConstitutionalConventionDelegateInfo.xlsx")
View(ConstitutionalConventionDelegateInfo)



# install.packages("devtools")
devtools::install_github("lbusett/insert_table")

#Frequency TABLES looking into the distribution of basic demographic variables 

#TABLE 1#
#Frequency Table showing gender parity in the Constitutional Convention 
tab1(ConstitutionalConventionDelegateInfo$Gender, sort.group = "decreasing", cum.percent = TRUE)


genderage <-  table(ConstitutionalConventionDelegateInfo$Gender, 
                    ConstitutionalConventionDelegateInfo$`Age Range`)

knitr::kable(head(genderage[, 1:5]), "pipe")

#TABLE 2#
#Frequency Table showing age range distribution in the Constitutional Convention 
tab1(ConstitutionalConventionDelegateInfo$`Age Range`, sort.group = "decreasing", cum.percent = TRUE)

#TABLE 3#
#Frequency Table showing Macrozone distribution in the Constitutional Convention 
tab1(ConstitutionalConventionDelegateInfo$Macrozone, sort.group = "decreasing", cum.percent = TRUE)


#PLOTS for Manuscript# 

#FIGURE 4 
#Plot showing the CC makeup by the delegate's completed educational level 
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, educational_level) %>%
  ggplot(aes(x =educational_level, fill= educational_level)) + geom_bar() +
  theme(axis.text.x = element_text(angle = 60, hjust=1)) +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

#FIGURE 5
#Plot showing the CC makeup by the delegate's profession 
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, profession) %>%
  ggplot(aes(x = profession, fill= profession)) + geom_bar() +
  theme(axis.text.x = element_text(angle = 60, hjust=1)) +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

#FIGURE 6
#Plot showing the general (concept explained in the 
#manuscript) frequency of the  political parties + independents in the Constitutional Convention 
ConstitutionalConventionDelegateInfo %>%
  group_by(lastname_firstname, polparty_gen) %>%
  ggplot(aes(x= polparty_gen, fill = polparty_gen)) + geom_bar() +
  theme(axis.text.x = element_text(angle = 65, vjust = 0.9, hjust=1))+
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

#FIGURE 7 
#Plot showing the Commission makeup by political party  
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, comission) %>%
  ggplot(aes(x = comission, fill= polparty_gen)) + geom_bar() +
  theme(axis.text.x = element_text(angle = 60, hjust=1)) 

#FIGURE 8
#Plot showing the CC makeup by political tendency where Independientes = Independents, Oficialismo= Government, Oposici??n= Opossition, 
#Pueblos Originarios = Indigenous peoples' quotas
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, tendency) %>%
  ggplot(aes(x = tendency, fill= tendency))  + geom_bar() + 
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")





##

#EXTRA TABLES# 
#Frequency Table showing Regional distribution  in the Constitutional Convention 
tab1(ConstitutionalConventionDelegateInfo$Region, sort.group = "decreasing", cum.percent = TRUE)

#Frequency Table showing political party distribution in the Constitutional Convention 
tab1(ConstitutionalConventionDelegateInfo$polparty_gen, sort.group = "decreasing", cum.percent = TRUE)

#Frequency Table showing political tendency distribution in the Constitutional Convention 
tab1(ConstitutionalConventionDelegateInfo$politicaltrend, sort.group = "decreasing", cum.percent = TRUE)




#EXTRA PLOTS,,, NOT FOR FINAL MANUSCRIPT 

#Plot showing the general (concept explained in the 
#manuscript) frequency of the  political parties + independents in the Constitutional Convention 
ConstitutionalConventionDelegateInfo %>%
  group_by(lastname_firstname, polparty_gen) %>%
  ggplot(aes(x= polparty_gen, fill = polparty_gen)) + geom_bar() +
  theme(axis.text.x = element_text(angle = 65, vjust = 0.9, hjust=1))+
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

#Plot showing the in detail frequency (concept explained in the 
#manuscript) of the  political parties + independents in the Constitutional Convention 
ConstitutionalConventionDelegateInfo %>%
  group_by(lastname_firstname, polparty_detail) %>%
  ggplot(aes(x= polparty_detail, fill = polparty_detail)) + geom_bar() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

#Plot showing the frequency of each gender in the CC 
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, Gender) %>%
  ggplot(aes(x = Gender, fill=Gender))  + geom_bar() + 
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

#Plot showing the relationship between Gender and Political Party distribution in the CC
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, Gender) %>%
  ggplot(aes(x = Gender, fill=polparty_gen))  + geom_bar()

#Plot showing the relationship between Gender and Political Tendency in the CC's distribution 
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, Gender) %>%
  ggplot(aes(x = Gender, fill=polparty_gen))  + geom_bar()

#Plot showing regional representation by the CC delegates
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, Region) %>%
  ggplot(aes(x = Region, fill=Region))  + geom_bar() + 
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white") +
  theme(axis.text.x = element_text(angle = 70, hjust=1))

#Plot showing macrozone representation by the CC delegates 
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, Macrozone) %>%
  ggplot(aes(x = Macrozone, fill=Macrozone))  + geom_bar() + 
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

#Classification of CC delegaates by Age Range with the following pre-made bins:
#"20-29", "30-39", "40-49", "50-59", "60 or above"
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, Gender) %>%
  ggplot(aes(x = `Age Range`, fill=`Age Range`))  + geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

#Plot showing the relationship between age ranges and political party affiliation within the CC 
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, Gender) %>%
  ggplot(aes(x = `Age Range`, fill=polparty_gen))  + geom_bar()

#Plot showing the Commission makeup in numbers 
ConstitutionalConventionDelegateInfo %>% 
  group_by(lastname_firstname, comission) %>%
  ggplot(aes(x = comission, fill= comission))  + geom_bar() +
  theme(axis.text.x = element_text(angle = 60, hjust=1)) +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")












