
################################################################################
#                     Logic of Randomized Experiments                          #
#                         Discussion Section #2                                #
################################################################################

# This section, we're still going to be working with the replication data from
# Lauren Young's 2018 paper "The psychology of state repression: Fear and
# dissent decisions in Zimbabwe."

# I am going to have you form into small groups of 2 or 3 to explore the dataset
# a bit more. In particular, try to do the following:

# 1) Read the paper, download the dataset directly from Harvard Dataverse
# (https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/UNNCTR),
# explore the contents of the zip file a bit, and read the data into R.

fear_data <- read.csv("https://raw.githubusercontent.com/amandaweiss/PLSC341/main/Example Data - Young 2018 Fear.csv")

View(fear_data)

str(fear_data)


# 2) Choose one or two covariates to explore in greater depth (please don't use
# the ones we talked about in section last week). Make a plot for each covariate
# to show that covariate's distribution. For the continuous covariate, calculate
# the mean and two variances: First, write a function for the plug-in sample
# variance formula given in lecture and use it to calculate the sample variance.
# Then, use the built-in R function var() to calculate the variance of the
# covariate vector.

# In this example solution, I'm going to explore `rooms` and `trauma_exp`.

# Barplot of Trauma Exposure Index
barplot(table(fear_data$trauma_exp),
        main = "Trauma Exposure among Research Participants in Young 2018",
        xlab = "Trauma Exposure Buckets")

# Histogram of Urban Assets Covariate
hist(fear_data$assets_pc_urb,
     main = "Asset Distribution",
     xlab = "Values")

# Mean of Urban Assets Covariate
mean(fear_data$assets_pc_urb, na.rm = TRUE)

# Plug-in Sample Variance for Urban Assets Covariate
plug_in_sample_var <- function(vec){
  return(mean(vec^2, na.rm = TRUE) - mean(vec, na.rm = TRUE)^2)
}
plug_in_sample_var(fear_data$assets_pc_urb)

# Built-in Variance Calculation for Urban Assets Covariate
?var
View(var)
var(fear_data$assets_pc_urb, na.rm = TRUE)

# 3) Time allowing: Also write a function for the unbiased sample variance and
# compare the result to the other two variances. And/or try to calculate the 
# regression for the treatment outcome that we ran in section last week with the 
# covariates you've explored and without weights. 

# Unbiased Sample Variance for Urban Assets Covariate 
unbiased_sample_var <- function(vec){
  plug_in_sample_var_result <- mean(vec^2, na.rm = TRUE) - 
                               mean(vec, na.rm = TRUE)^2
  unbiased_sample_var <- length(vec)/(length(vec) - 1)*plug_in_sample_var_result
  return(unbiased_sample_var)
}
unbiased_sample_var(fear_data$assets_pc_urb)

# 4) Be prepared to come back and discuss what you found with the class.



