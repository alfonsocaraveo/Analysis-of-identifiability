rm(list=ls())
#dev.off()
#######################################################
#                  Libraries                          #
#######################################################
library(lubridate)
library(mnormt)

#######################################################
#                  Parameters                         #
#######################################################
Hour <- c("2024-06-14-10-23-55")
set.seed(ymd_hms(Hour)) 
sol0 <- 0.1331
vallambda0 <- 0.0722
VecTime0 <- seq(0,40,0.8) #50 simulated data
Num_of_samples <- 1
valalpha0 <- 1
valsigma0 <- 0.0302

#######################################################
#                  Real Sol                           #
#######################################################
Real_Solution <- sol0/((1-sol0)*exp(-vallambda0*VecTime0)+sol0)

#######################################################
#                  Simulation                         #
#######################################################

Matrix_dat_sim <- rmnorm(Num_of_samples, mean = Real_Solution,varcov = valsigma0^2*diag(length(Real_Solution)))
Matrix_dat_sim[1] <- sol0  
sum( Matrix_dat_sim  < 0  ) # Check 0's

#######################################################
#                  Save data                          #
#######################################################

write.table(Matrix_dat_sim, file = "Matrix_dat_sim_Cap_Fab.csv")