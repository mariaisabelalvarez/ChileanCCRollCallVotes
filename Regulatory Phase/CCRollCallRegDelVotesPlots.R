#CCROLLCALLVOTES for the Regulatory Phase of the Constitutional Process by Total (in-favor) Votes by Delegate 
#This script contains multiple plots analyzing the regulatory phase of the Constitutional Process' by total votes by delegate 



#Read In Data Set
library(readxl)
CCRollCallVotesRegDelegateVotes <- read_excel("Desktop/CCRollCallVotesRegDelegateVotes.xlsx")
View(CCRollCallVotesRegDelegateVotes)
library(scales)

#Plot Showing Number of Votes Casted in Favor by the by the Constitutional Convention Delegates
CCRollCallVotesRegDelegateVotes %>%
  group_by(lastname_firstname, votes_infavor_del) %>%
  ggplot(aes(x = lastname_firstname, y=votes_infavor_del, fill=polparty_gen )) + geom_col() +
  labs(y = "Votes Casted In Favor", x = "Constitutional Convention Delegate") +
  scale_y_continuous(limits = c(0,1009))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#Plot Showing the Percentage of Votes Casted in Favor by the Constitutional Convention Delegates
CCRollCallVotesRegDelegateVotes %>%
  group_by(lastname_firstname, percentage_votesinfavor) %>%
  ggplot(aes(x = lastname_firstname, y=percentage_votesinfavor, fill=polparty_gen)) + geom_col() +
  labs(y = "Percentage Votes Casted In Favor", x = "Constitutional Convention Delegate") +
  scale_y_continuous(limits = c(0,100))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#percentage of votes by party 
CCRollCallVotesRegDelegateVotes %>%
  group_by(polparty_gen, percentage_votesinfavor) %>%
  ggplot(aes(x = polparty_gen, y=percentage_votesinfavor, fill=polparty_gen)) + geom_col() +
  labs(y = "Percentage Votes Casted In Favor", x = "Political Party") +
  scale_y_continuous(limits = c(0,100))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#Plot showing the percentage of votes casted, polparty by frequency 
CCRollCallVotesRegDelegateVotes %>%
  group_by(polparty_gen, percentage_votesinfavor) %>%
  ggplot(aes(x=polparty_gen, y=percentage_votesinfavor, fill= polparty_gen, color= polparty_gen)) + geom_count() +
  labs(y = "Percentage Votes Casted In Favor", x = "Political Party") +
  scale_y_continuous(limits = c(0,100))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) 

#Splitting up by political party 
CCRollCallVotesRegDelegateVotes %>%
  group_by(polparty_gen, percentage_votesinfavor) %>%
  ggplot(aes(x = polparty_gen, y=percentage_votesinfavor, fill=polparty_gen)) + geom_col() +
  labs(y = "Percentage Votes Casted In Favor", x = "Constitutional Convention Delegate") +
  scale_y_continuous(limits = c(0,100))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.3, hjust=1)) + facet_wrap(vars(polparty_gen), nrow = 10)

#work in progress 
CCRollCallVotesRegDelegateVotes %>%
  group_by(lastname_firstname, percentage_votesinfavor) %>%
  ggplot(aes(x = lastname_firstname, y=percentage_votesinfavor, fill=polparty_gen)) + geom_col() +
  labs(y = "Percentage Votes Casted In Favor", x = "Constitutional Convention Delegate") +
  scale_y_continuous(limits = c(0,100))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=0.5)) + facet_wrap(vars(polparty_gen), nrow = 10) 


summarize(CCRollCallVotesRegDelegateVotes)

table(CCRollCallVotesRegDelegateVotes$polparty_gen)

table(CCRollCallVotesRegDelegateVotes$votes_infavor_del)












  
  