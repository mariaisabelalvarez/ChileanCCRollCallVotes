
#CCROLLCALLVOTES for the Substantive Phase of the Constitutional Process by Total (in-favor) Votes by Delegate 
#This script contains multiple plots analyzing the regulatory phase of the Constitutional Process' by total votes by delegate 

library(kableExtra)

#Read In Data Set
library(readxl)
CCRollCallVotesSubsDelegateVotes <- read_excel("Documents/GitHub/ChileanCCRollCallVotes/Substantive Phase/CCRollCallVotesSubsDelegateVotes.xlsx")
View(CCRollCallVotesSubsDelegateVotes)

#STANDARD DEVIATION BY TENDENCY 
sdpoltend <- CCRollCallVotesSubsDelegateVotes%>%
  group_by(tendency) %>%
  summarise_at(vars(percentage_infavor), list(name=sd))

#Table SD by tendency in knitr format 
knitr::kable(head(sdpoltend[, 1:2]), "pipe", col.names = c("Political Tendency",
                                                           "Standard Deviation"))

#STANDARD DEVIATION BY POLITICAL PARTY 
sdpolpar <- CCRollCallVotesSubsDelegateVotes%>%
  group_by(polparty_gen) %>%
  summarise_at(vars(percentage_infavor), list(name=sd))

knitr::kable(head(sdpolpar[1:12, 1:2]), "pipe")

kable(sdpolpar)

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
