# OR568 Fall 2019
# Lec#1
#install.packages("quantmod")
#install.packages("fBasics")
library(quantmod)
library(fBasics)

par(mfrow = c(2,2))

# load AAPL price from Yahoo finance
getSymbols('AAPL', from = "2007-01-01", to = "2019-08-22")
AAPL_Adjusted = AAPL$AAPL.Adjusted
plot(AAPL_Adjusted, main="AAPL")

# find the AAPL daily returns
AAPL.rtn = diff(log(AAPL$AAPL.Adjusted))
plot(AAPL.rtn)

# show histogram 
hist(AAPL.rtn,nclass=50)

x = seq(-1,1,.001)

AA = AAPL.rtn[-(1)]
# kernel density estimator (default is gaussian kernel)
d1 = density(AA)

# normal density
y = dnorm(x,mean(AA),stdev(AA))

# plot kernel density function
plot(d1$x,d1$y, xlab='AAPL return', ylab='density', type='l', col='blue')
# plot normal density function
lines(x,y, lty=2, col='red', lwd=2)

# show statistics
basicStats(AAPL.rtn)

# text book (A) chapter 2.1
#install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)

# Predicting Fuel economy
data(FuelEconomy)
library(lattice)  # graphical package for visualizing multivariate data

# Plot shown in the text:
cars2010 <- cars2010[order(cars2010$EngDispl),]
cars2011 <- cars2011[order(cars2011$EngDispl),]

cars2010a <- cars2010
cars2010a$Year <- "2010 Model Year"
cars2011a <- cars2011
cars2011a$Year <- "2011 Model Year"

plotData <- rbind(cars2010a, cars2011a)

plotTheme <- bookTheme(FALSE)
plotTheme$plot.symbol$col <- rgb(.2, .2, .2, .5)
plotTheme$plot.symbol$cex <- 0.7
trellis.par.set(plotTheme)

# Figure 2.1
xyplot(FE ~ EngDispl|Year, plotData, xlab = "Engine Displacement", ylab = "Fuel Efficiency (MPG)", between = list(x = 1.2))

# simple plot
par(mfrow = c(1,2))
plot(cars2010a$EngDispl, cars2010a$FE, main = "2010 Model Year", xlab="Engine Displacement", ylab = "Fuel Efficiency (MPG)")

# Simple Fit
fit1 = lm(cars2010a$FE ~ cars2010a$EngDispl)
a = fit1[1]$coefficients[1]
b = fit1[1]$coefficients[2]
abline(a,b, lwd = 2, col = "red")
summary(fit1)
#
plot(cars2011a$EngDispl, cars2011a$FE, main = "2011 Model Year", xlab="Engine Displacement", ylab = "Fuel Efficiency (MPG)")

# Simple Fit
fit2 = lm(cars2011a$FE ~ cars2011a$EngDispl)
a = fit2[1]$coefficients[1]
b = fit2[1]$coefficients[2]
abline(a,b, lwd = 2, col = "red")
summary(fit2)

## Fit a single linear model and conduct 10-fold Cross validation to estimate the error
# classification regression package
# install.packages("caret")

library(ggplot2)
library(caret)
set.seed(1)

lm1Fit <- train(FE ~ EngDispl, 
                data = cars2010,
                method = "lm", 
                trControl = trainControl(method= "cv"))
lm1Fit

# text book (A) chapter 3
# (A) Exercise 3.1 (a)
# install.packages("mlbench")
library(mlbench)
# load the data Glass
data(Glass)
# display the structure of the data
str(Glass)

# Look at all pairwise scatter plots:
pairs(Glass)

# Look at all the correlation between all predictors:
cor( Glass[,-10] ) # drop the factor variable (the last 10th one)

# Look at the correlation of each predictor with the class label:
cor( Glass[,-10], as.numeric( Glass[,10] ) )

# (b) Visually display all data; some have outliers and skewed

par(mfrow=c(1,1))
boxplot( Glass)

# (b) Visually display how Na, Si, and Ca depend on the glass type:
par(mfrow=c(1,3)) 
boxplot( Glass$Na ~ Glass$Type )
boxplot( Glass$Si ~ Glass$Type )
boxplot( Glass$Ca ~ Glass$Type )

# (b) Visually display how Mg, AL, and K depend on the glass type:
par(mfrow=c(1,3)) 
boxplot( Glass$Mg ~ Glass$Type, main="Mg" )
boxplot( Glass$Al ~ Glass$Type, main ="Al" )
boxplot( Glass$K ~ Glass$Type, main="K" )

par(mfrow=c(1,1))

# Use the "corrplot" command:
#install.packages("corrplot")
library(corrplot)
#corrplot( cor( Glass[,-10] ), order="hclust" )
corrplot( cor( Glass[,-10] ))

# (b) Compute the skewness of each feature:
#library(e1071)
apply( Glass[,-10], 2, skewness )

# (b) Look at histograms of some of the skewed predictors:
par(mfrow=c(1,3))
hist( Glass$K ) # Looks like a data error in that we have only two samples with a very large value 
hist( Glass$Ba ) # Looks like a skewed distribution
hist( Glass$Mg ) # Looks multimodal

# (B) Chapter 1, Problems 1, 2

# load the Ecdat package from David Rupper's book
# all data files have been copied into my following working directory
# You should do the same (download the data into your own computer)

setwd("/Users/Kchang/Desktop/KC/KCC/GMUCOURS/OR568/Fall2019/R/Ecdat/data")
 
#install.packages("Ecdat")
library(Ecdat)
dat = read.csv("Stock_FX_bond.csv", header=TRUE)

# In order to refer to the objects by names
names(dat)
# By attaching a data frame (or list) to the search path it is possible to refer to the variables in the data frame by their names alone
attach(dat)

dev.new()
par(mfrow = c(2,2))
# Plot the Adjusted Closing prices
plot(GM_AC)
plot(F_AC)

# plot GM returns against F returns
n = dim(dat)[1]
GMreturn = GM_AC[2:n]/GM_AC[1:n-1]-1
Freturn = F_AC[2:n]/F_AC[1:n-1]-1
# dev.new()
#par(mfrow=c(1,1))
plot(GMreturn, Freturn)
cor(GMreturn, Freturn)

# Simple Fit
fit3 = lm(GMreturn ~ Freturn)
a = fit3[1]$coefficients[1]
b = fit3[1]$coefficients[2]
abline(a,b, lwd = 2, lty = 2, col = "red")
summary(fit3)

# correlation between log return and return
GMLogreturn = log(1+GMreturn)
cor(GMLogreturn,GMreturn)
#dev.new()
plot(GMLogreturn,GMreturn)

# (B) Chapter 2, Problem 4
set.seed(2019)
dev.new()

# Single trial 
r = rnorm(45,mean=0.05/253, sd=0.23/sqrt(253))   # generate 45 random log returns
logPrice = log(1e6)+ cumsum(r)
minlogP = min(logPrice)       # lowest price over the 45 days
equity_history = c(1000000, exp(logPrice))
plot(equity_history, type="l", ylab ="Equity", xlab = "Days", col = "blue", ylim= c(min(equity_history,900000),max(equity_history)))
abline(950000,0, lwd = 2, col = "Red", lty = 2)

# multiple MC trials 
# dev.new()
niter = 1e2  # number of iterations/trials
below = rep(0,niter)
for (i in 1:niter)
{
  r = rnorm(45,mean=0.05/253, sd=0.23/sqrt(253))   # generate random numbers
  logPrice = log(1e6)+ cumsum(r)
  minlogP = min(logPrice)       # lowest price over the 45 days
  below[i] = as.numeric(minlogP < log(950000))
  if (i == 1) 
  { plot(c(1000000, exp(logPrice)), type = "l", ylim = c(750000, 1250000), xlab = "Days", ylab ="Equity Value", col = "blue") }
  else
  { lines(c(1000000, exp(logPrice)), col = rgb(runif(1), runif(1), runif(1))) }
  end
}
abline(950000,0, lwd = 2, col = "Red", lty = 2)

mean(below)



