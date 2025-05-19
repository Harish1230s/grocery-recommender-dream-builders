data2 <- read.csv("2.csv", header = TRUE, sep = ",")
View(data2)
str(data2)

which(duplicated(data2))
data2 <- data2[!duplicated(data2),]
View(data2)

data2 <- data2[data2$basket_value>0,]
View(data2)

which(is.na(data2$id))
data2 <- data2[!is.na(data2$id),]

which(is.na(data2$date))
data2[data2$date=="",]
data2 <- data2[!data2$date=="",]
View(data2)

which(is.na(data2$day))
data2[data2$day=="",]
data2 <- data2[!data2$day=="",]
View(data2) 

library(dplyr)
length(unique(unlist(data2 %>% select(starts_with("Item_")))))
