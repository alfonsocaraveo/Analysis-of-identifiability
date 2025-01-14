rm(list=ls())
#dev.off()
library(fields)
#######################################################
#                  Functions                          #
#######################################################
source("Solver_Frac_Cap_Fab.R")
source("Minus_Log_lik.R")
source("Lik_alpha_a.R")
source("Minus_Log_Profilelik_alpha_a.R")



###############################################################
#               Point estimation                              #
###############################################################
data <- read.table("Matrix_dat_sim_Cap_Fab.csv")$x
x0 <- data[1]
VecTime0 <- seq(0,40,0.8)

vecest <- c()

U <-  diag(3)
Ci <- c(0,0,0)


vecest <- constrOptim(c(1,0.0722,0.0302),Minus_Log_lik,grad=NULL, ui=U,ci=Ci,
                      mu = 1e-04, control = list(),
                      method = "Nelder-Mead",
                      outer.iterations = 100, outer.eps = 1e-05,
                      VecCaseObs = data,vec_time = VecTime0)$par

###############################################################
#               Data graph                                    #
###############################################################

y_axis <- Solver_Frac_Cap_Fab(vecest[1],vecest[2],x0,VecTime0)

plot(VecTime0,y_axis,type = "l")
points(VecTime0,data)

###############################################################
#               Profile Likelihood                            #
###############################################################
Valalpha <- seq(0.6,1.1,length.out=350)
Vallambda <- seq(0.06,0.125,length.out=350)
Lik<-matrix(rep(0,length(Valalpha)*length(Vallambda)),ncol=length(Vallambda))
for(i in 1:length(Valalpha))
{
  for(j in 1:length(Vallambda))
  {
    VecPar<-c(Valalpha[i],Vallambda[j])
    Lik[i,j] <- Lik_alpha_a(VecPar,data,VecTime0)
    print(c(i,j))
  }
}


###############################################################
#                 Profile Likelihood graph                    #
###############################################################

persp(x=Valalpha,y=Vallambda,z=Lik,
      ticktype="detailed",theta=30,phi=30,expand=0.5,
      cex.axis=1,nticks=4,
      col="gray",xlab="alpha",ylab="lambda",
      zlab="\n\nRelative Likelihood")


lik1 <- Lik/max(Lik)

image.plot(Valalpha,Vallambda,lik1,xlab=expression(alpha),ylab=expression(lambda),
           col=gray.colors(64,start=1,end=0),main="",cex.lab=2,cex.axis=1.4)
contour(Valalpha,Vallambda,lik1,levels = c(0.05),lty = 2,lwd = 2,labcex = 1,cex.lab=1.4,cex.axis=1.4,ylab=expression(lambda) ,xlab = expression(alpha), add = TRUE)