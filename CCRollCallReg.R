#Imported the dataset manually as it didn't let me with code 
CCRollCallREG <- read_excel("Downloads/CCRollCallREG.xlsx")

#Matrix 
CCRollCallREG_1 <- data.matrix(CCRollCallREG[-c(1:13)])













#Roll Call 
rollcall <- rollcall(CCRollCallREG_1, legis.names = CCRollCallREG$lastname_firstname)?ideal()

#Ideal 
d1 <- ideal(rollcall, d=1, normalize = T, store.item = T, maxiter=600, burnin=100, thin=10)

d1$xbar

<- Ideal p

d1_plot <- data.frame(d1$xbar) %>% rownames_to_column() %>% cbind(ee)

(colMeans(d1$x)/d1Sxbar) %>% round(5)


