################################################################################
#                     Logic of Randomized Experiments                          #
#                         Discussion Section #4                                #
################################################################################

# This section, we're going to keep thinking about the experimental setting in
# which someone is trying to identify 4 correct items (it can either be cups
# with milk poured first or cute doggie photos) that have been randomly
# scrambled with some sample of incorrect items.

# We have already found, in this setting, that if a guesser identifies all 4
# items correctly when there are 3 or 4 incorrect items (that is, when there is
# a total sample of 7 or 8 items), we can reject the null hypothesis that the
# guesser has no ability to detect the correct items.

# But how large does the sample need to be if we want to reject the null
# hypothesis when the guesser only identifies 3 of the correct items? Figuring
# that out is your exercise for today. Try see how the p-values change you get
# when you increase the number of incorrect items. How large does the sample
# have to be to reject the null hypothesis at the 0.05 level with 3 correct and 
# 1 incorrect? 

# If you have extra time, also repeat the exercise simultaneously changing the 
# size of the number of correct items, so that you have balanced groups. Then 
# see what sample size you need to reject the null hypothesis for a guess that 
# gets all but 1 correct and just 1 incorrect.

# Hint: try using a for-loop starting with a sample size of 7 and going up from
# there.

# ------------------------------------------------------------------------------
# First, trying to do this just by increasing the number of incorrect items in
# the sample, but keeping fixed that there are 4 incorrect items:







# ------------------------------------------------------------------------------
# Second, repeating the exercise with balanced/evenly increasing "correct" and 
# "incorrect" groups:



