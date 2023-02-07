#5.2 In Class Assignment 

library(munsell)

mdata <- read_csv("Documents/GitHub/d2m-2023-shared/datasets/MM Data.csv")

mmdata.long <- read_csv(("Documents/GitHub/d2m-2023-shared/datasets/MM Data.csv"))%>%
  pivot_longer(cols = c("Red", "Green", "Blue", "Orange","Yellow", "Brown"),names_to = "Color", values_to = "Number")

#PLOTS

#Plot 1 
ggplot(mmdata.long, aes(x=Color, y=Number, color= Color, fill=Color)) + 
  geom_violin(alpha = 0.3)+ 
  scale_fill_manual(values=c("blue", "brown","green","orange","red","yellow")) +
  geom_jitter(mapping=aes(color=Color))+
  theme_classic() +
  scale_color_manual(breaks = c("Blue", "Brown", "Green","Orange", "Red","Yellow"),
                     values=c("blue", "brown","green","orange","red","yellow")) 


#Plot 2 Challenge
ggplot(mmdata.long, aes(x= Color, y= Number)) +
  geom_boxplot() +
  scale_x_discrete(limits= c("Red", "Orange", "Yellow","Green", "Blue","Brown"))+
  geom_violin(aes(fill= Color, color= Color), alpha=0.2) +
  scale_fill_manual(breaks = c("Red", "Orange", "Yellow","Green", "Blue","Brown"),
                    values = c("Red", "Orange", "Yellow","Green", "Blue","Brown")) +
  geom_jitter(mapping=aes(color= Color, fill= Color)) +
  theme_classic() +
  scale_color_manual(breaks = c("Red", "Orange", "Yellow","Green", "Blue","Brown"),
                     values = c("Red", "Orange", "Yellow","Green", "Blue","Brown"))
  
  

