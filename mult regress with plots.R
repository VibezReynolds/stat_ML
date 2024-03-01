head(New.Text.Document)
deli = New.Text.Document

kp = iris
View(iris)

model= lm( iris$Sepal.Length ~ iris$Sepal.Width+ iris$Petal.Length )
summary(model)

predict( model) #to show fitted values

yhat = model$fitted.values   #another way of showing fitting values except the predict func
t = rstudent(model)
qqnorm(t)
plot(iris$Sepal.Width , t)
plot( iris$Sepal.Width , iris$Petal.Length)
ggplot( kp , aes(Sepal.Width , Petal.Length))+geom_point(size=2 ,aes(col= Species)+stat_smooth(formula = log(y)~x  , method = lm) )# plot of the regressor varibles

g = lm(log(iris$Sepal.Length)~iris$Sepal.Width)
summary(g)
