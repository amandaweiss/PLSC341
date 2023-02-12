#'---
#' title: Logic of Randomized Experiments | Discussion Section 3
#' author: Exercises
#' date: Last updated Feb. 9, 2023
#'---


#' ## Setup
#' 
#' This discussion section, we're going to analyze the data from the cutest
#' doggie experiment. You are going to be tasked with identifying whether the
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
#'
#' **Step 1:** Read the data into R. Go to the Excel sheet at bit.ly/cutest_doggie.
#' You can either download the Excel file and copy the first sheet of data into R
#' directly, or you can download the sheet with your class' data in the Excel
#' file into a csv and read it in.
#' 
#' 
#' **Step 2:** The cutest doggie is the first picture shown (option A) in 4 out of 7 
#' questions. Calculate the number of different ways you chould choose 4 items  
#' out of 7. 
#' 
#' 
#' **Step 3:** You got a certain number of guesses correct. To get a p-value, we want
#' to know the probability of observing the outcome (number of guesses correct)
#' plus the chances of observing better results (if you did not get the best
#' possible result). Calculate this p-value.
#' 
#' 
