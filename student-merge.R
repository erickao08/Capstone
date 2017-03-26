library(dplyr)


df1 <-read.csv('student-mat.csv')
df2 <-read.csv('student-por.csv')

d3=merge(df1,df2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
print(nrow(d3)) # 382 students

View(d3)