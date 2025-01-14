Lik_alpha_lambda<-function(vecpar,VecCaseObs,vec_time)
{ 
  Mean_data <- Solver_Frac_Cap_Fab(vecpar[1],vecpar[2],VecCaseObs[1],vec_time)
  Like<- sum((VecCaseObs-Mean_data)^2/length(VecCaseObs))^(-length(VecCaseObs)/2)
  return(Like)
}