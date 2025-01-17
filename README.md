# Analysis-of-identifiability
Analysis of identifiability problems for the Caputo-Fabrizio derivative with the logistic model.
# Scripts Overview for the analysis of identifiability
This repository contains the following R scripts, each serving a specific purpose in the workflow:

# 1. data simulation.R
**Description:** Script for generates data for the classical logistic model.

**Libraries Used:** 

- `lubridate`: For date and time manipulation.
- `mnormt`: For multivariate normal distribution functions.

# 2. Estimation and graph.R
**Description:** Script for performs point estimation and profile likelihood graph.

**Libraries Used:** 

- `fields`: For graph.

**Functions used:** 

- `Solver_Frac_Cap_Fab.R`
- `Minus_Log_lik.R`
- `Lik_alpha_lambda.R`

# 3. Lik_alpha_lambda.R
**Description:** Implements the profile likelihood function for the parameters **alpha** and **lambda**.

**Input:**

- `vecpar`: A vector containing the parameters **alpha** and **lambda**.
- `VecCaseObs`: A vector of observed data.
- `vec_time`: A vector of time points associated with each observation.


# 4. Matrix_dat_sim_Cap_Fab.cvs
**Description:** Data output from data simulation script.

# 5. Minus_Log_lik.R
**Description:** Implements the Loglikelihood function for the parameters **alpha**, **lambda** and **sigma**.

**Input:**

- `vecpar`: A vector containing the parameters **alpha**, **lambda** and **sigma**.
- `VecCaseObs`: A vector of observed data.
- `vec_time`: A vector of time points associated with each observation.


# 6. Solver_Frac_Cap_Fab.R
**Description:** Implements the solution of the fractional logistic model considering the Caputo-Fabrizio derivative.


**Input:**

- `alpha`: Value of the parameters **alpha**.
- `lambda`: Value of the parameters **lambda**.
- `x0`: Initial value.
- `vec_time`: A vector of time points.
