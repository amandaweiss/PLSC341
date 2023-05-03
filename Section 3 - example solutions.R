#'---
#' title: Logic of Randomized Experiments | Discussion Section 3
#' author: Example Solutions
#' date: Last updated Feb. 9, 2023
#'---


#' ## Setup
#' 
#' This discussion section, we're going to analyze the data from the "cutest
#' doggie" experiment. You are going to be tasked with identifying whether the
#' class performed better than chance at identifying which photos show the 
#' cutest doggie first in a series of questions. You are going to do this in 
#' groups.

#' How you should think about this is as follows: There are 7 pairs of photos. 
#' The cutest doggie, Frankie, is in the first photo in 4 out of those 7 photos. 
#' I have  randomized the order in which you are being shown the paired photos. 
#' You have a certain number of different ways of getting a certain number of  
#' choices correct. You can calculate the number of times you would have gotten 
#' at least that much correct by chance over the number of possible 
#' randomizations.
#' 
#' ## Exercises
#' 
#' **Step 0:** Describe the hypothesis you're testing. And define the potential
#' outcomes.
#'
#' The null hypothesis is that a majority of the class cannot identify whether 
#' the cutest dog is shown first in a paired photo.
#' 
#' The potential outcomes describe the possible sets of results of choices:
#' 
#' * All 4 "cutest dog first" photos are identified correctly
#' * 3 "cutest dog first" photos are identified correctly and 1 incorrectly
#' * 2 "cutest dog first" photos are identified correctly and 2 incorrectly
#' * 1 "cutest dog first" photo  is identified correctly and 3 incorrectly
#' * 0 "cutest dog first" photos are identified correctly
#'
#' **Step 1:** Read the data into R. Go to the Excel sheet at bit.ly/cutest_doggie.
#' You can either download the Excel file and copy the first sheet of data into R
#' directly, or you can download the sheet with your class' data in the Excel
#' file into a csv and read it in.
#' 

cutest_doggie_experiment <- read.csv(
  "https://raw.githubusercontent.com/amandaweiss/PLSC341/main/Cutest_Doggie_Experiment.csv")
#' 
#' **Step 2:** The cutest doggie is the first picture shown (option A) in 4 out of 7 
#' questions. Calculate the number of different ways you chould choose 4 items  
#' out of 7. 
#' 
#' This is just ${7\choose 4}$. Remember that R has a built-in function for calculating combinations, so you do not have to write out the formula (unless you want to).
#' 
choose(7, 4)
#' 
#' **Step 3:** You got a certain number of guesses correct. To get a p-value, we want
#' to know the probability of observing the outcome (number of guesses correct)
#' plus the chances of observing better results (if you did not get the best
#' possible result). Calculate this p-value.
#' 

# First, look at the data:
cutest_doggie_experiment

# Second, add up how many the class identified correctly. 
sum(cutest_doggie_experiment$correct)

#' 
#' We find that in this case, both discussion sections identified all of the Frankie-first photo pairs correct (the 4 
#' correct, 0 incorrect potential outcome), and 
#' there is only 1 way to do that, so the relevant p-value is 
#' $\frac{1}{{7 \choose 4}} = \frac{1}{35} \approx 0.029$.
#' 
#' Still, for fun, we could think through the ways to get to all the different potential outcomes as follows:
#' 
#' * 4 correct, 0 incorrect: We have to select 4 from 4 Frankie photo pairs correctly and there are ${4\choose 4} = 1$ ways to do so.
#' 
#' * 3 correct, 1 incorrect: First we have to choose 3 Frankie-first photo pairs out of 4 Frankie-first photo pairs correctly. There are $4$ ways to do this. Then, we have to choose 1 incorrect photo pair, out of 3 remaining incorrect photo pairs. There are ${3\choose 1} = 3$  ways to do this. So, we have $4\times 3 = 12$ ways to get 3 correct and 1 incorrect.
#' 
#' * 2 correct, 2 incorrect: First, we have to choose 2 correct photos out of 4. There are ${4\choose 2} = 6$ ways to do this. Then, we have to choose 2 incorrect photos out of 3. There are ${3\choose 2} = 3$ ways to do this. So we have 18 ways to get 2 correct and 2 incorrect.
#' 
#' * 1 correct, 3 incorrect: First, we have to choose 1 correct photo out of 4. There are ${4\choose 1} = 4$ ways to do this. Then, we have to choose 3 incorrect photos out of 3. There is only way to do this---${3\choose 3} = 1$.  So there are $4\times 1 = 4$ ways to choose 1 incorrect and 3 correct.
#' 
#' * 0 correct, 4 incorrect: this value is 0. If you know that you have to choose four photos as having Frankie first, and you have seven photos of which four show Frankie first, there is no way to not get at least 1 of the Frankie-first photos. We could be formal and calculate it out anyway: ${4\choose 0} \times {3\choose 4} = 1 \times 0 = 0$.
#' 
#' If we check our calculations---that all these different ways to get different outcomes match the total number of possible ways to choose photo pairs---we do indeed find that $1 + 12 + 18 + 4 + 0 = 35$.
#' 
#' Remember, to get the p-value we want the probability of getting a potential outcome at least as "good" as the one we got. The corresponding p-values for each potential outcome (number of random arrangements or "randomizations" associated with a given potential outcome over number of possible random arrangements or "randomizations") are as follows:
#' 
#' * 4 correct, 0 incorrect: $\frac{1}{35} \approx 0.029$
#' 
#' * 3 correct, 1 incorrect: $\frac{1}{35} + \frac{12}{35} = \frac{13}{35} \approx 0.371$
#' 
#' * 2 correct, 2 incorrect: $\frac{1}{35} + \frac{12}{35} + \frac{18}{35} = \frac{31}{35} = 0.886$
#' 
#' * 1 correct, 3 incorrect: $\frac{1}{35} + \frac{12}{35} + \frac{18}{35} + \frac{4}{35} = \frac{35}{35} = 1$ 
#' 
#' * 0 correct, 4 incorrect: $\frac{1}{35} + \frac{12}{35} + \frac{18}{35} + \frac{4}{35} + \frac{0}{35} = \frac{35}{35} = 1$ 
#' 





