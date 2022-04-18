library(TSA)
library(MASS)
library(car)
library(forecast)
library(tseries)
library(quadprog)
library(zoo)
library(fracdiff)
library(fUnitRoots)
library(lmtest)
library(stats)
library(sarima)
library(astsa)

#Input File Curah Hujan Format (.csv)

y <- read.csv('CURAH HUJAN.csv')
y <- ts(y$x,start=2018,frequency = 12)
y 
#cek stasionerits dalam mean
#Uji ADF Data
adfTest(y)
diff1=diff(y,differences=1)
adfTest(diff1)
ggtsdisplay(diff1)

diff2=diff(diff1,differences=6)
ggtsdisplay(diff2)
diff2

#Estimasi Parameter Model 
fit1=arima(x=y,order=c(2,1,0),seasonal=list(order=c(0,1,1),period=6))
fit1
coeftest(fit1)
fit2=arima(x=y,order=c(1,1,0),seasonal=list(order=c(0,1,1),period=6))
fit2
coeftest(fit2)
fit3=arima(x=y,order=c(0,1,1),seasonal=list(order=c(0,1,1),period=6))
fit3
coeftest(fit3)
fit4=arima(x=y,order=c(1,1,1),seasonal=list(order=c(0,1,1),period=6))
fit4
coeftest(fit4)
fit5=arima(x=y,order=c(2,1,1),seasonal=list(order=c(0,1,1),period=6))
fit5
coeftest(fit5)
fit6=arima(x=y,order=c(2,1,2),seasonal=list(order=c(0,1,1),period=6))
fit6
coeftest(fit6)
fit7=arima(x=y,order=c(0,1,2),seasonal=list(order=c(0,1,1),period=6))
fit7
coeftest(fit7)
fit8=arima(x=y,order=c(1,1,2),seasonal=list(order=c(0,1,1),period=6))
fit8
coeftest(fit8)

#meliahat signifikansi stasioner
printstatarima <- function (x, digits = 4,se=T,...){
  if (length(x$coef) > 0) {
    cat("\nCoefficients:\n")
    coef <- round(x$coef, digits = digits)
    if (se && nrow(x$var.coef)) {
      ses <- rep(0, length(coef))
      ses[x$mask] <- round(sqrt(diag(x$var.coef)), digits = digits)
      coef <- matrix(coef, 1, dimnames = list(NULL, names(coef)))
      coef <- rbind(coef, s.e. = ses)
      statt <- coef[1,]/ses
      pval  <- 2*pt(abs(statt), df=length(x$residuals)-1, lower.tail = F)
      coef <- rbind(coef, t=round(statt,digits=digits),sign.=round(pval,digits=digits))
      coef <- t(coef)
    }
    print.default(coef, print.gap = 2)
  }
}
printstatarima(fit1)
printstatarima(fit2)
printstatarima(fit3)
printstatarima(fit4)
printstatarima(fit5)
printstatarima(fit6)
printstatarima(fit7)
printstatarima(fit8)

#pengujian diagnostic
#uji normalitas residual
res1=resid(fit1)
shapiro.test(res1)
res2=resid(fit2)
shapiro.test(res2)
res3=resid(fit3)
shapiro.test(res3)
res4=resid(fit4)
shapiro.test(res4)
res5=resid(fit5)
shapiro.test(res5)
res6=resid(fit6)
shapiro.test(res6)
res7=resid(fit7)
shapiro.test(res7)
res8=resid(fit8)
shapiro.test(res8)

#uji residual whitenouse
Box.test(res1,lag=12,type="Ljung")
Box.test(res1,lag=24,type="Ljung")
Box.test(res1,lag=36,type="Ljung")
Box.test(res1,lag=48,type="Ljung")

Box.test(res2,lag=12,type="Ljung")
Box.test(res2,lag=24,type="Ljung")
Box.test(res2,lag=36,type="Ljung")
Box.test(res2,lag=48,type="Ljung")

Box.test(res3,lag=12,type="Ljung")
Box.test(res3,lag=24,type="Ljung")
Box.test(res3,lag=36,type="Ljung")
Box.test(res3,lag=48,type="Ljung")

Box.test(res4,lag=12,type="Ljung")
Box.test(res4,lag=24,type="Ljung")
Box.test(res4,lag=36,type="Ljung")
Box.test(res4,lag=48,type="Ljung")

Box.test(res5,lag=12,type="Ljung")
Box.test(res5,lag=24,type="Ljung")
Box.test(res5,lag=36,type="Ljung")
Box.test(res5,lag=48,type="Ljung")

Box.test(res6,lag=12,type="Ljung")
Box.test(res6,lag=24,type="Ljung")
Box.test(res6,lag=36,type="Ljung")
Box.test(res6,lag=48,type="Ljung")

Box.test(res7,lag=12,type="Ljung")
Box.test(res7,lag=24,type="Ljung")
Box.test(res7,lag=36,type="Ljung")
Box.test(res7,lag=48,type="Ljung")

Box.test(res8,lag=12,type="Ljung")
Box.test(res8,lag=24,type="Ljung")
Box.test(res8,lag=36,type="Ljung")
Box.test(res8,lag=48,type="Ljung")

#mencari nilai MSE 
n=36 #dengan nilai n = 36
mse1=sum(res1^2)/n 
mse2=sum(res2^2)/n 
mse3=sum(res3^2)/n 
mse4=sum(res4^2)/n 
mse5=sum(res5^2)/n 
mse6=sum(res6^2)/n 
mse7=sum(res7^2)/n 
mse8=sum(res8^2)/n 
{ 
  cat("\n") 
  
  cat("\t\t=========================OUTPUT==========================","
\n") 
  cat("\n") 
  cat("\t\t\t    NILAI MEAN SQUARE ERROR","\n") 
  cat("\n") 
  cat("\t\t--------------------------------------------------------
","\n") 
  cat("\t\t|           Model               |Nilai MSE |","\n") 
  cat("\t\t--------------------------------------------------------
","\n") 
  cat("\t\t|SARIMA(2,1,0)(0,1,1)^6         |",mse1," |","\n") 
  cat("\t\t|SARIMA(1,1,0)(0,1,1)^6         |",mse2," |","\n") 
  cat("\t\t|SARIMA(0,1,1)(0,1,1)^6         |",mse3," |","\n") 
  cat("\t\t|SARIMA(1,1,1)(0,1,1)^6         |",mse4," |","\n")
  cat("\t\t|SARIMA(2,1,1)(0,1,1)^6         |",mse5," |","\n")
  cat("\t\t|SARIMA(2,1,2)(0,1,1)^6         |",mse6," |","\n")
  cat("\t\t|SARIMA(0,1,2)(0,1,1)^6         |",mse7," |","\n")
  cat("\t\t|SARIMA(1,1,2)(0,1,1)^6         |",mse8," |","\n")
  
  cat("\t\t--------------------------------------------------------
","\n") 
  
  cat("\n")} 

#Peramalan
fit4
ramalan=predict(fit4,n.ahead=6)
ramalan
ts.plot(y,ramalan$pred)
model1=sarima(y,1,1,1,0,1,1,6)
model1
sarima.for(y,6,1,1,1,0,1,1,6)
