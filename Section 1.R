################################################################################
#                     Logic of Randomized Experiments                          #
#                         Discussion Section #1                                #
################################################################################

# We're just going to run a toy R script to see if you are set up to do the
# basic tasks that we will be doing a ton in this class. And to give you an
# example of one, nice readable way to format R code.

# To do this, we are going to use the example of the replication data for Lauren
# Young's field experiment, "The psychology of state repression: Fear and
# dissent decisions in Zimbabwe." The full paper is available here:
# doi:10.1017/S000305541800076X

# -------------------- Getting Acquainted with the Data ------------------------

fear_data <- read.csv("https://raw.githubusercontent.com/amandaweiss/PLSC341/main/Young2018_replication_data_Fear_Dissent.csv")

View(fear_data)

str(fear_data)

# ----------------- Exploring the Treatment and Control Groups -----------------

# Counting up how many study participants are in each treatment/control group
freq_counts_treat_groups <- table(fear_data$treat_assign)
freq_counts_treat_groups

# Looking at proportions of study participants in each treatment/control group
prop_in_treat_groups <- prop.table(freq_counts_treat_groups)
prop_in_treat_groups

# Making a pie chart of how many study participants are in each group
pie(table(fear_data$treat_assign))

# ------------- Modeling whether Fear Treatments Reduce Dissent ----------------

# This model is a linear regression looking at whether being in the "fear"
# treatment group reduces your likelihood of dissenting against the government.
mod1g <- lm(prob_act_st ~ treat_assign, 
            data = fear_data[fear_data$treat_assign != 'TP',], 
            weights = fear_data$TG_inv[fear_data$treat_assign!='TP'])

# As it happens, being in the fear treatment group significantly reduces  
# dissent probability
summary(mod1g)

# --------------------------- Covariate Plots ----------------------------------

# Income distribution of study participants
hist(fear_data$income)

# Local communities the participants come from
barplot(table(fear_data$community))







