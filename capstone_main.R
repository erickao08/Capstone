library(dplyr)
library(ggplot2)

#read csv files and merge them together
df1 <-read.csv('student-mat.csv')
df2 <-read.csv('student-por.csv')

d3=merge(df1,df2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))


#create 2 columns to store grade mean for 2 classes
d3_clean<-d3%>% mutate(grade_mean_Math=(G1.x+G3.x+G2.x)/3)%>%mutate(grade_mean_Portuguese=(G1.y+G3.y+G2.y)/3)

df1<-df1%>%mutate(grade_mean=(G1+G2+G3)/3)
df2<-df2%>%mutate(grade_mean=(G1+G2+G3)/3)
df1$Dalc<-as.factor(df1$Dalc)
#plots for x= daily consumption y=G1, seperated by gender

#get the distribution of each gender in each group
base1<-ggplot(df1,aes(x=Dalc,y=grade_mean,col=sex))

base1+geom_point()  #bad dotplot

base1+geom_jitter()#good dotplot
#what is the distribution of each group
base2<-ggplot(df1,aes(x=sex,y=grade_mean,col=sex))
base2+geom_boxplot()+facet_grid(.~Dalc)

#question: why there are seperated dot in the plot? 

#get the proportion of each group in each gender
ggplot(df1, aes(x=sex ,fill= Dalc ))+geom_bar(position="fill")
