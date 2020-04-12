##################################################################
### Puzzle Date: 2020.04.10
### Puzzle Name: Can You Catch The Free T-Shirt?
### Version: Express
### Date Created: 2020.04.11
##################################################################

# load packages
library(plyr)
library(ggplot2)

# find the max range of a projectile with a constant velocity and constant gravity
u = 40                      # velocity in m/s
g = 9.8                     # acceleration due to gravity
maxrange = (u**2 * sin(2* 45 * pi/180))/g

# divide the max range by 100 to simulate 100 rows of seats
bins = maxrange/100

# create a function to calculate the distance of a projectile at any angle
# use round_any() from plyr to group the distances according to the bins created above (which simulate rows of seats)
fun <- function(x){
  round_any(((u**2 * sin(2*x*pi/180))/g), bins,  f = ceiling)
}

# apply the function to angles from 0 to 90 in 0.5 degree increments
distance <- sapply(seq(0,90,0.5), fun)

# create a data frame that combines the angle (0 to 90, by 0.5), the distance, and the corresponding row number
# to find the row number, multiply the distance times 100/maxrange
df <- as.data.frame(cbind(seq(0,90,0.5), distance, distance*100/maxrange))
colnames(df) <- c('angle','distance', 'row')

# plot the histogram of the row numbers; the result will show that row 100 is the best place to sit
ggplot(df, aes(x = row)) +
  geom_histogram(binwidth = 1)