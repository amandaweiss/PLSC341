################################################################################
#                     Logic of Randomized Experiments                          #
#                         Discussion Section #6                                #
################################################################################

# This week, we're going to be getting into some real data, and reading some 
# papers. You are going to think of yourself as replicating and doing some
# robustness checks on recent published articles in the top political science
# journal. In other words, you are going to be seeing whether the findings of an
# article hold up.

# For this exercise, you can choose any of the following three recent articles
# published in the American Political Science Review:


# Kalla & Broockman 2022, "Outside Lobbying” over the Airwaves: A Randomized 
# Field Experiment on Televised Issue Ads," doi:10.1017/S0003055421001349.

# Badrinathan 2021, "Educative Interventions to Combat Misinformation: Evidence
# from a Field Experiment in India," doi:10.1017/S0003055421000459.

# Cheema et al. 2023, "Canvassing the Gatekeepers: A Field Experiment to 
# Increase Women Voters’ Turnout in Pakistan," doi:10.1017/S0003055422000375.


# Once you have chosen a paper, you should do the following:
  
# 1) Read the paper! Spend some time thinking about it. Then answer the
# following: A) What are this paper's hypotheses? B) Is the paper using
# design-based inference techniques? Why/why not? C) Do you buy the
# randomization strategy? What makes the experimental design believable? D) Do
# you think the experiment is ethical? What are the relevant ethical
# considerations and challenges that did or should have gone into implementing
# the project?
  
# 2) Download the replication data and familiarize yourself with it.
  
# 3) Plot the distribution of the people in treatment groups (the code from the
# first discussion section might help you here).

# 4) Make sure that you have a binary treatment variable. If you are looking at
# a paper with multiple possible treatments, create a new variable for a binary
# treatment, where `1` indicates "any possible treatment" and `0` indicates
# "control."
# ***You do not absolutely have to create a binary treatment variable, but it
# will potentially  make step 6 a bit easier, if you are not comfortable yet
# thinking about randomization in R, and make step 7 *much* easier. 

# 5) Estimate the  treatment effect, either using a difference-in-means
# estimate or a regression coefficient (maybe think back to Question 8 on the
# homework).

# 6) Run a Fisher's exact test with the estimator that you chose. Report the 
# results and graph the estimate with the null distribution.

# 7) Calculate the Hajek or Horvitz_Thompson estimate of the 
# difference-in-means.



