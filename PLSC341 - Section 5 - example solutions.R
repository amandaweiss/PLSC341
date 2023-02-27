################################################################################
#                     Logic of Randomized Experiments                          #
#                         Discussion Section #5                                #
################################################################################

# The goal of this section will be to get you familiar with the differences
# between the Horvitz-Thompson and Hajek estimators. These exercises will also
# get you in the habit of writing for-loops for simulations and thinking about
# data-generating processes.

# ------------------------------ Exercise 1 ------------------------------------
# For this exercise, you should rewrite the code from Prof. Aronow's ht-sim.R
# example file to include a calculation for the Hajek estimator, as well as the
# Horvitz-Thompson estimator. I have copied over the code for you; your task is
# just to modify it and consider whether the result is unbiased. So you're going
# to want to have 6 items: the original mean, the mean of the simulated
# Horvitz-Thompson estimates, the bias of the Horvitz-Thompson estimator in this
# case, the mean of the simulated Hajek estimates, and the bias of the Hajek
# estimate.


set.seed(123)

# Simulation for HT estimator

N <- 5
y <- c(4, 3, 2, 1, 4)
mean(y) # mu

# Sampling design:
drawsample <- function() {
  R <- rep(NA, N)
  R[1] <- rbinom(1, 1, .5)
  if(R[1] == 1) R[2:N] <- rbinom(N - 1, 1, .25)
  if(R[1] == 0) R[2:N] <- rbinom(N - 1, 1, .50)
  return(R)
}

# This is a weird sampling design. if the first unit is selected, every other
# unit has a 25% chance of being selected. if the first unit is not selected,
# every other unit has a 50% chance of being selected.

# The probability of unit 1 being selected is 0.5. the probability of every
# other unit is therefore .375. This vector of probabilities is formalized 
# below.

pis <- c(.5,rep(.375, N - 1))

### show unbiasedness

niter <- 50000

htests <- rep(NA, niter)

hajektests <- rep(NA, niter)

for (iter in 1:niter) {
  R <- drawsample()
  yR <- y*R
  htests[iter] <- sum(yR/pis)/N
  hajektests[iter] <- sum(yR/pis)/sum(R/pis)
}

# ORIGINAL MEAN (mu):
mean(y) 

# MEAN OF THE SIMULATED HT ESTIMATES:
mean(htests) 

# BIAS CALCULATION FOR THE HT ESTIMATES:
mean(y) - mean(htests) 

# MEAN OF THE SIMULATED HAJEK ESTIMATES:
mean(hajektests, na.rm = TRUE)

# BIAS CALCULATION FOR THE HAJEK ESTIMATES:
mean(y) - mean(hajektests, na.rm = TRUE) 

# ------------------------------ Exercise 2 ------------------------------------
# For this second exercise, you will once again be calculating Horvitz-Thompson
# and Hajek estimates, checking the biases. However, you will create your own data-generating
# process. So, you can create your own `N`, `y` `drawsample()`, or `pis`. You
# can base it on data-generating process that Prof. Aronow created above, but
# you should make at least one modification.

## EXAMPLE: Same N and y vector, complete randomization ------------------------

N <- 5
y <- c(4, 3, 2, 1, 4)
n_treat <- 3

drawsample2 <- function(n_treat){ # here is a function argument for 
                                            # setting the  size of the treatment 
                                            # group
  D <- c(rep(1, n_treat), rep(0, N - n_treat))
  R <- sample(D)
  return(R)
}

pis2 <- rep(n_treat/N, N)

htests2 <- rep(NA, niter)

hajektests2 <- rep(NA, niter)

for (iter in 1:niter) {
  R <- drawsample2(n_treat)
  yR <- y*R
  htests2[iter] <- sum(yR/pis2)/N
  hajektests2[iter] <- sum(yR/pis2)/sum(R/pis2)
}

# MEAN OF THE SIMULATED HT ESTIMATES:
mean(htests2) 

# BIAS CALCULATION FOR THE HT ESTIMATES:
mean(y) - mean(htests2) 

# MEAN OF THE SIMULATED HAJEK ESTIMATES:
mean(hajektests2)

# BIAS CALCULATION FOR THE HAJEK ESTIMATES:
mean(y) - mean(hajektests2) 

## EXAMPLE: Same N and y vector, Bernoulli trials with condition ---------------

N <- 5
y <- c(4, 3, 2, 1, 4)

# This function performs  a Bernoulli trial to create treatment assignment. It
# has a condition that if all the treatment assigns are "in control" (that is,
# zero), it will perform a sequence of Bernoulli trials again until it gets a
# set of randomizations with at least one unit in treatment (at least one 
# randomization equal to one)
drawsample3 <- function(){ 
  repeat{
    R <- rbinom(5, 1, 0.5)
    if (sum(R) > 0){
      return(R)
    }
  }
}

pis3 <- rep(16/31, 5)

htests3 <- rep(NA, niter)

hajektests3 <- rep(NA, niter)

for (iter in 1:niter) {
  R <- drawsample3()
  yR <- y*R
  htests3[iter] <- sum(yR/pis3)/N
  hajektests3[iter] <- sum(yR/pis3)/sum(R/pis3)
}

# MEAN OF THE SIMULATED HT ESTIMATES:
mean(htests3) 

# BIAS CALCULATION FOR THE HT ESTIMATES:
mean(y) - mean(htests3) 

# MEAN OF THE SIMULATED HAJEK ESTIMATES:
mean(hajektests3)

# BIAS CALCULATION FOR THE HAJEK ESTIMATES:
mean(y) - mean(hajektests3) 


