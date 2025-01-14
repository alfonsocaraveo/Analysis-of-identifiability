Minus_Log_Profilelik_alpha_a<-function(vecpar,VecCaseObs,vec_time)
{ 
  vec_x <- Solver_Frac_Cap_Fab(vecpar[1],vecpar[2],VecCaseObs[1],vec_time)
  
  Like <- (length(VecCaseObs)/2)*log((sum((VecCaseObs-vec_x)^2)))
  return(Like)
}