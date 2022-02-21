summary(Dataset)
Dataset=na.omit(Dataset)
#Summary of Expenses
summary(Dataset$expenses)
hist(Dataset$expenses,main="Medical Expenses",xlab="Expenses",col="skyblue")
#Variable Age, BMI, Children
plot(Dataset$age,Dataset$expenses,main="Age ~ Expenses",xlab="Age",ylab="Expenses",col="orange")
plot(Dataset$bmi,Dataset$expenses,main="BMI ~ Expenses",xlab="BMI",ylab="Expenses",col="orange")
ggplot(Dataset,aes(children,expenses))+geom_point(col="blue")+labs(title="Number of Dependants vs. Expenses")+xlab("No.of Children")+ylab("Expenses")+theme(plot.background = element_rect(fill = "white"),
                                                                                                                                                            panel.background = element_rect(fill = "white"),axis.line = element_line(color='black'))
#cor(Dataset$children,Dataset$expenses)
#Age + smoker VS. expenses
ggplot(Dataset,aes(x=age, y=expenses, color=smoker))+geom_point()+labs(title="Age*Smoker vs. Expenses")+xlab("AGE")+ylab("Expenses")+theme(plot.background = element_rect(fill = "white"),
                                                                                                                                           panel.background = element_rect(fill = "white"),axis.line = element_line(color='black'))

#BMI+ Smoker vs.expenses
ggplot(Dataset,aes(x=bmi, y=expenses, color=smoker))+geom_point()+
labs(title="BMI*Smoker vs. Expenses")+xlab("BMI")+ylab("Expenses")+theme(plot.background = element_rect(fill = "white"),
                                              panel.background = element_rect(fill = "white"),axis.line = element_line(color='black'))
                                              
#Smoker vs expenses
ggplot(Dataset,aes(as.factor(smoker),expenses))+geom_boxplot(fill="skyBlue")+labs(title="Smoker ~ Expenses")+xlab("Smoker")+ylab("Expenses")+theme(plot.background = element_rect(fill = "white"),
                                                                                    panel.background = element_rect(fill = "white"),axis.line = element_line(color='black'))

#Sex vs expenses
ggplot(Dataset,aes(as.factor(sex),expenses,fill=sex))+geom_boxplot()+labs(title="Gender ~ Expenses")+xlab("Sex")+ylab("Expenses")+theme(plot.background = element_rect(fill = "white"),
                                                                                                                  panel.background = element_rect(fill = "white"),axis.line = element_line(color='black'))

#Region vs expenses
ggplot(Dataset,aes(as.factor(region),expenses,fill=region))+geom_boxplot()+labs(title="Region ~ Expenses")+xlab("Region")+ylab("Expenses")+theme(plot.background = element_rect(fill = "white"),
                                                                                                                   panel.background = element_rect(fill = "white"),axis.line = element_line(color='black'))

#No of Dependants vs Expenses


#Creating Dummy Variables for Smoker,Region & sex.
Dataset1=Dataset
install.packages("fastDummies")
library("fastDummies")
Dataset1 = dummy_cols(Dataset1, select_columns =c('smoker',"region","sex"),remove_selected_columns = TRUE)

#Correlation of all the variable
bmi=Dataset1$bmi
children=Dataset1$children
str(Dataset1)
cor(Dataset1,method="pearson")
round(cor(Dataset1),2)
#correlation Matrix of all the variables
install.packages("corrplot")
library("corrplot")
corrplot(cor(Dataset1),method="circle",title="Correlation Matrix",tl.srt = +45,tl.cex=0.8)


#cor(Dataset1[c("age","bmi","children","expenses","smoker_yes","region_northwest","region_southeast")])
#pairs(Dataset1[c("age","bmi","children","expenses","smoker_yes","region_northwest","region_southeast")])

#Pairwise Correlation
install.packages("psych")
library(psych)
pairs.panels(Dataset1[c("age","bmi","children","expenses","smoker_yes","region_southeast" ,"sex_male")],scale=FALSE,stars =TRUE,cex.cor=5,cex.labels=1)

#Model1
mymodel=lm(expenses~age+sex_male+children+bmi+smoker_yes+region_southeast,Dataset1)
summary(mymodel)
vif(mymodel)
plot(mymodel)
#Model2
Dataset1$bmi35=ifelse(Dataset1$bmi>=35,1,0)
mymodel1=lm(expenses~age+sex_male+children+region_southeast+bmi+bmi35*smoker_yes,Dataset1)
summary(mymodel1)
vif(mymodel1)
plot(mymodel1)

Model4
mymodel3=lm(expenses~age+sex_male*smoker_yes+children+region_southeast+bmi+bmi35*smoker_yes,Dataset1)
summary(mymodel3)

###Model3

Dataset1$age40=ifelse(Dataset1$age>=40,1,0)
mymodel2=lm(expenses~age+sex_male+age40*smoker+children+bmi+bmi35*smoker,Dataset1)
summary(mymodel2)
vif(mymodel2)
anova(mymodel,mymodel1,mymodel2)
          ###   MODEL AND MODEL1  ###
anova(mymodel,mymodel1)
         ###   MODEL 1 AND MODEL2  ###
anova(mymodel1,mymodel2)
         ###   MODEL 2 AND MODEL  ###
anova(mymodel,mymodel1)
   


plot(Dataset1, pch = 16, col = "blue") #Plot the results
abline(mymodel1)

plot(mymodel1$residuals, pch = 16, col = "red")
