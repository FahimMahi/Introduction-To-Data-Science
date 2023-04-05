#KNN Algorithm
mydata<- read.csv("D:/Semester/10) Spring 2023/Introduction To Data Science/Final Practice/iris.csv",header = TRUE,sep = ",")
mydata
head(mydata)
str(mydata)
normalizatiion<-function(x){(x-min(x))/(max(x)-min(x))}
iris_norm<- as.data.frame(lapply(iris[,c(1,2,3,4)], normalizatiion))
iris_norm
summary(iris_norm)

head(iris_norm)

#data split
random<-sample(1:nrow(iris_norm),0.7*nrow(iris_norm)) #random selection of 70% of data
iris_train<- iris_norm[random,] #70% training data
iris_train
iris_test<-iris_norm[-random,] #remaining 30% test data
iris_test

head(iris_test)
head(iris_train)

#data split cut and also detect the target attributes
iris_train_labels<- mydata[random,5] #column 5 e pass
iris_train_labels
iris_test_labels<- mydata[-random,5]
iris_test_labels

head(iris_train_labels)
head(iris_test_labels)

#building a machine learning model
install.packages("class")
library(class)
ml<-knn(iris_train,iris_test,cl=iris_train_labels,k=27) #cl = class
ml

#confusion matrix; Model Evaluation
tab<-table(ml,iris_test_labels)
tab

