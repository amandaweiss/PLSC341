################################################################################
#                     Logic of Randomized Experiments                          #
#                         Discussion Section #10                               #
################################################################################

# This week, we're going to be focused on two topics: designing the 
# randomization for your final project, simulating some fake data to
# (pre-)analyze and performing power analyses.
# (Generally, you will want to know how you are randomizing participants before
# doing a power analysis!)



# TASK 1: Choosing an idea, a randomization strategy, and an estimator ---------

# Last week, you should have come uep with some possible ideas for your final
# project. Now is your chance to run with that! Choose one of your ideas, write
# down how you are randomizing the data, and choose an estimator or multiple
# estimators to run (difference-in-means, regression coefficient, ANOVA, etc.)
# Write down why you are choosing that randomization and estimator.



# TASK 2: Simulating data (so that you can test your analysis code) ------------

# Usually, when you are doing a pre-analysis plan for an experiment, you will
# want to write out the code that you will use to analyze the experiment in
# advance. And most people find it easier to write analysis code if they have a
# dataset to try out. For this task, make a fake dataset for your experiment.
# You should have, at minimum, the following columns in your data: Outcome - Y,
# Treatment Assignment - D, Effect Size - b, Error - e. You may also want to
# include a column for blocks, if you are doing blocked randomization.

# Hint: usually when you are creating a simulated experimental data frame, you
# go through something like the following steps:

#   (1) Make a data frame or matrix with the desired number of rows and columns. 
#   (2) If you are using blocks, create however many blocks by just making the
#       block column a vector of factor numbers, like `c(rep(1, n_block1`, 
#      rep(2, n_block2))` etc.
#   (3) Assign the treatment by creating a vector of possible treatment
#       assignments and then randomly sampling the possible treatment 
#       assignments without replacement.
#   (4) Create the error term by assigning `rnorm(n)` to the error term column.
#   (5) Choose whatever arbitrary effect size. For example, you could have a 
#       linear additive effect size 10% and assign it to the effect size column 
#       as `df$effect <- 0.1`
#   (6) Fill in the outcome variable. For example, you should just be able to
#       write some sort of code like `df$outcome <- df$treatment_assignment *
#       df$effect_size + df$error`



# TASK 3: (Pre-)Analyzing the data ---------------------------------------------

# Run whatever estimator you want to use on the data that you simulated for Task
# 2. Collect the estimate, standard errors, and p-value. Write down why you are
# choosing to calculate standard errors and p-value in whatever way you have
# chosen to do it.



# TASK 4: Power analysis -------------------------------------------------------

# How many participants are you going to need for your experiment? There are a
# few different ways you can calculate power. If you are doing it manually, the
# logic is more or less the following:

# (1) Make a lot of different simulated datasets with your chosen effect size
#     and a given sample size.
# (2) Run your chosen (estimator) on each simulated dataset and save the p-value.
# (3) Calculate what percentage/proportion of the saved p-values are less than
#     your chosen significance threshold. That percentage/proportion is your
#     simulated power for that effect size and sample size.
# (4) Do this for different effect sizes/sample sizes. Maybe using for-loops.

# However! Sometimes, you may want to also use a package to calculate your
# statistical power, either as a convenience or as a check on the code you wrote
# yourself. There are several options for doing this. I quite like the packages
# `pwr`
# (https://cran.r-project.org/web/packages/pwr/vignettes/pwr-vignette.html) and
# `DeclareDesign` (https://declaredesign.org/r/declaredesign/).  `pwr` is easier
# to use, but `DeclareDesign` is more powerful.

# For this task, you should run a power analysis to figure out what size sample
# you need.

# Hint: Here, it's pretty important to choose plausible effect sizes, because if
# you choose too large an effect size for your power analysis, it may be too
# easy to "detect" your guessed effect size and you may think you need fewer
# participants than you actually do. Researchers often figure out their
# estimated effect size by either running a pilot version of their experiment or
# by finding similar studies that have already been published and seeing how big
# those effect sizes are.






