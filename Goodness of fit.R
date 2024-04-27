#Firth’s penalized-likelihood approach
data <- data.frame(
  x = c(rep(0, 12), rep(1, 20)),
  y = c(rep(0, 12), rep(0, 9),rep(1, 11))
)
model <- glm(y ~ x, data = data, family = binomial)
summary(model)

library(logistf)
firth_model <- logistf(y ~ x, data = data)
summary(firth_model)
# exact method & goodness of fit
library("sas7bdat")
dos <- read.sas7bdat(file = "/home/whan4/dos.sas7bdat", debug = FALSE)
for (i in 1:length(dos$marital)) {
  if (dos$dep[i]>0){
    dos$depd[i]=1
  }
  else{
    dos$depd[i]=0
  }
  if(!is.na(dos$marital[i])){
  if (dos$marital[i] == 2) {
    dos$MS[i] <- 1
  }
  else if (dos$marital[i] == 6) {
    dos$MS[i] <- 2
  }
  else if (dos$marital[i] == 1 || (dos$marital[i] >= 3 && dos$marital[i] <= 5)) {
    dos$MS[i] <- 3
  }
  }
  else {
    dos$MS[i] <- NA
  }
}
a<-data.frame(depd=dos$depd,Gender=dos$Gender,MS=dos$MS)
modela <- glm(a$depd ~ a$Gender * a$MS, data=a, family=binomial)
summary(modela)
library("ResourceSelection")
a<-na.omit(a)
hl_gofa <- hoslem.test(a$depd, fitted(modela))
hl_gofa
modelb <- glm(a$depd ~ a$Gender + a$MS, data=a, family=binomial)
summary(modelb)
hl_gofb <- hoslem.test(a$depd, fitted(modelb))
hl_gofb

# Box-Tidwell test & Pregibon’s link test & goodness of fit
c<-data.frame(depd=dos$depd,Gender=dos$Gender,MS=dos$MS,age=dos$age)
modelc <- glm(c$depd ~ c$Gender + c$MS + c$age, data=c, family=binomial)
summary(modelc)
c<-na.omit(c)
hl_gofc <- hoslem.test(c$depd, fitted(modelc))
hl_gofc

library("car")
logodds <- modelc$linear.predictors
boxTidwell(logodds ~ c$age, global=TRUE, data = c)
plot(logodds ~ c$age)

library(LDdiag)
pregibon(modelc)
modeld <- glm(c$depd ~ c$Gender + c$MS + c$age, data=c, family=binomial(link = "Pregibon"))
summary(modeld)
help("glm")
