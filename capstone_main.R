library(dplyr)
library(ggplot2)

#read csv files and merge them together
df1 <-read.csv('student-mat.csv')
df2 <-read.csv('student-por.csv')

d3=merge(df1,df2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
print(nrow(d3)) # 382 students


#plots for x= daily consumption y=G1, seperated by gender

base1<-ggplot(df1,aes(x=Dalc,y=G1,col=sex))
base1+geom_point()
base1+geom_jitter()
base1+geom_boxplot()+facet_grid(.~Dalc)
