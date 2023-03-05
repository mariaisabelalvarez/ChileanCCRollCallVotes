
#CCROLLCALLVOTES for the Substantive Phase of the Constitutional Process by Total (in-favor) Votes by Delegate 
#This script contains multiple plots analyzing the regulatory phase of the Constitutional Process' by total votes by delegate 


#Read In Data Set
library(readxl)
CCRollCallVotesSubsDelegateVotes <- read_excel("CCRollCallVotesSubsDelegateVotes.xlsx")
View(CCRollCallVotesSubsDelegateVotes)


#FIGURE 10 
#Plot showing the percentage of votes casted in the Substantive Phase, polparty by frequency 
CCRollCallVotesSubsDelegateVotes %>%
  group_by(polparty_gen, percentage_infavor) %>%
  ggplot(aes(x=polparty_gen, y=percentage_infavor, fill= polparty_gen, color= polparty_gen)) + geom_count() +
  labs(y = "Percentage of Votes Casted In Favor", x = "Political Party") +
  scale_y_continuous(limits = c(0,100))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) 

#FIGURE 12
#Plot showing the percentage of votes casted in the Substantive Phase, polparty by frequency 
CCRollCallVotesSubsDelegateVotes %>%
  group_by(tendency, percentage_infavor) %>%
  ggplot(aes(x=tendency, y=percentage_infavor, fill= tendency, color= polparty_gen)) + geom_count() +
  labs(y = "Percentage of Votes Casted In Favor", x = "Political Tendency") +
  scale_y_continuous(limits = c(0,100))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) 
