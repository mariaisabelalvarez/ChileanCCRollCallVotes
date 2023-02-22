#5.1 In Class Assignment with ggplot

mdata <- read_csv("Documents/GitHub/d2m-2023-shared/datasets/MM Data.csv")

mmdata.long <- read_csv(("Documents/GitHub/d2m-2023-shared/datasets/MM Data.csv"))%>%
  pivot_longer(cols = c("Red", "Green", "Blue", "Orange","Yellow", "Brown"),names_to = "Color", values_to = "Number")

#Plot 1 
mmdata.long %>%
  group_by(Number, Color) %>%
  ggplot(aes(x= Color, y= Number, fill=Color)) + geom_boxplot() + theme()

#Plot 2 
mmdata.long %>%
  group_by(Number, Color) %>%
  ggplot(aes(x= Color, y= Number, fill=Color)) + geom_boxplot() + geom_jitter() +theme()

#Challenge plot- work in progress 
mmdata.long %>%
  group_by(Number, Color) %>%
  ggplot(aes(x= Color, y= Number, fill=Color)) + geom_boxplot() + geom_dotplot(binaxis ="y")+  theme()

  