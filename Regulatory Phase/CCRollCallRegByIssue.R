#CC ROLL CALL REG BY ISSUE 

library(readxl)
CCRollCallVotesRegIssueVotes <- read_excel("Desktop/CCRollCallVotesRegIssueVotes.xlsx")
View(CCRollCallVotesRegIssueVotes)


#Issues Overall 
CCRollCallVotesRegIssueVotes %>%
  group_by(issue, votes_infavor) %>%
  ggplot(aes(x=issue, y= votes_infavor)) + geom_col()

CCRollCallVotesRegIssueVotes %>%
  group_by(issue, outcome) %>%
  ggplot(aes(x=outcome)) + geom_bar() + theme(legend.position = "none")



         