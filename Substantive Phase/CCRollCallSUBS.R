#CC Roll Call Votes, Analysis of the Substantive Phase of the Constitutional Convention's Debate

#Library essential packages 
pacman::p_load(tidyverse, forcats, pscl, coda, ggrepel, readxl, mcmc, matrixStats)

#Read in data 
library(readxl)
CCRollCallSUBS <- read_excel("Downloads/CCRollCallSUBS.xlsx")
View(CCRollCallSUBS)

#Data to matrix form, omitting some information about the CC delegates in the spreadsheet
CCRollCallSUBS_1 <- data.matrix(CCRollCallSUBS[-c(1:13)])

#RollCall Function 
rollcall <- rollcall(CCRollCallSUBS_1, legis.names = CCRollCallSUBS$lastname_firstname)

?ideal()

#Running Ideal Function on one single dimension 
d1 <- ideal(rollcall, d=1, normalize = T, store.item = T, maxiter = 600, burnin = 100, thin = 10)

#Checking the Ideal Point values of all CC delegates 
d1$xbar
d1xbar <- d1$xbar

# (Arithmetic) mean of the xbar 
mean(d1$betabar, na.rm = TRUE)
avg <- -0.7422182

# sStandard deviation of the xbar 
sd <- sd(d1$betabar, na.rm = TRUE)
x <- t(d1$x[,,1])
ee <- rowSds(x)/sqrt(ncol(x))

#More data for figures 
d1_plot <- data.frame(d1$xbar) %>% rownames_to_column() %>% cbind(ee)

(colMeans(d1$x)/d1$xbar)%>%round(5)


ggplot(CCRollCallSUBS, aes(subs_1, subs_2)) + geom_bar()

# D1 Black and White Simple Scatter Plot 
d1_plot %>% 
  mutate(rowname = fct_reorder(rowname, D1)) %>% 
  ggplot(aes(x = D1, y = rowname)) +
  geom_point() + 
  theme_classic() +
  labs(y = "CC Delegate", x = "IDEAL on One Dimension")

?qt()



# D1 Scatter Plot with Error Bars 
d1_plot %>%
  mutate(rowname = fct_reorder(rowname, D1)) %>%
  ggplot(aes(x = D1, y = rowname)) +
  geom_point() +
  geom_errorbar(aes(xmin = d1_plot$D1 - qt(0.975, 50)*d1_plot$ee, xmax = d1_plot$D1 + qt(0.975, 50)*d1_plot$ee), width = .5, position = position_dodge(1))
theme_classic() +
  labs(y = "CC Delegate", x = "IDEAL on One Dimension") +
  theme(axis.text.y = element_text(angle = 0))+
  theme(axis.text.x = element_text(angle = 90))


#plot 
ggplot(d1_plot,aes(x=reorder(lastname_firstname,D1),
                   y=D1,
                   label = nomlist)) +
  geom_point(aes(color = nomlista),
             size= 3,
             shape= 17) +
  theme(axis.text.x=element_text(angle=45,hjust=1)) +
  #scale_color_manual(values=myPal)+
  ylab("")+
  xlab("")+
  theme(axis.text=element_text(size=6))



