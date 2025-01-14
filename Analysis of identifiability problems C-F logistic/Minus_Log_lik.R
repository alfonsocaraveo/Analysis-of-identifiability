Minus_Log_lik<-function(vecpar,VecCaseObs,vec_time)
{ 
  Mean_data <- Solver_Frac_Cap_Fab(vecpar[1],vecpar[2],VecCaseObs[1],vec_time)

  LogLike<- -length(VecCaseObs)*log(vecpar[3])-1/(2*vecpar[3]^2)*sum((VecCaseObs-Mean_data)^2)
  MinusLogLike<--LogLike
  return(MinusLogLike)
}