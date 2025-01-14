Solver_Frac_Cap_Fab <- function(alpha,lambda,x0,vec_time)
{
  
  # Implicit function
  Implicit_function <- function(x, t) {
    
    C_1 <- (lambda*alpha-lambda+1)/(lambda*alpha)
    C_2 <- (lambda*alpha-lambda-1)/(lambda*alpha)
    
    P_1 <- x^C_1*(1-x)^C_2
    P_2 <- x0^C_1*(1-x0)^C_2 * exp(t)
    return(P_1-P_2)
  }
  
  Solver_Implicit_function <- function(t) {
      result <- uniroot(function(x) Implicit_function(x, t), interval = c(0.0000000000001, 0.99999999999999), extendInt = "yes")
      return(result$root)
  }
  
  sol <- c()
  
  # Solve implicit equation for each t
  for (i in 1:length(vec_time)) {
    sol[i] <- Solver_Implicit_function(vec_time[i])
  }
  return(sol)
}