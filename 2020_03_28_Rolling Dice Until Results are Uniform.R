##################################################################
### Puzzle Date: 2020.03.27
### Puzzle Name: Can You Get The Gloves Out Of The Box?
### Version: Classic
### Date Created: 2020.03.28
##################################################################

# Iterate through the loop 10,000 times, producing a vector with the results
results <- c()        # clear the vectors "results"
for(j in 1:10000){    # simulate the activity 10,000 times
  rolls <- 1:6        # set a fair die of 1-6
  for (i in 1:100){   # roll the die up to 100 times (100 is more than would really ever be necessary)
    rolls <- sample(rolls, size = 6, replace = TRUE)    # reset the die based on a 6 randomized rolls
    if((max(rolls) == min(rolls)) & (min(rolls) == mean(rolls))){
      results <- c(results, i)    # record the result and end the loop if the min/max/mean of the die are equivalent
      break
    }
  }
}
mean(results)         # find the average value of the results vector (which is 10,000 values long)