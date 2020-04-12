##################################################################
### Puzzle Date: 2020.02.14
### Puzzle Name: Can You Solve This Rather Pedestrian Puzzle?
### Version: Express
### Date Created: 2020.03.21
##################################################################

library(ggplot2)
library(dplyr)
### Set number of city blocks (radius of City)
num <- 100

### Create square grid with all coordinates
x <- -num:num
y <- -num:num
df <- expand.grid(x = x, y = y)

### Find distance from center using old method (parallel sidewalks)
old_dist <- function(x,y) {
  abs(x) + abs(y)
}
df$old <- old_dist(x = df$x, y = df$y)

### Find distance from center using new method (diagonal sidewalks)
new_dist <- function(x, y) {
  ifelse(abs(x) >= abs(y), abs(x) * sqrt(2),abs(y) * sqrt(2))
}
df$new <- new_dist(x = df$x,y = df$y)

### Find if the new path is shorter
better <- function(x, y) {
  ifelse(x<=y, "Not better", "Better")
}
df$better <- better(x = df$old, y = df$new)
df$better <- as.factor(df$better)

### Find distance from center for each coordinate
dist <- function(x,y) {
  sqrt(x**2 + y**2)
}
df$dist <- dist(x = df$x,y = df$y)

### Only keep coordinates that are within the city radius
df2 <- df[df$dist <= num,]

### Plot results
ggplot(df2, aes(x = x, y = y, color = better)) +
  geom_point() +
  theme_minimal() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

### Find percent of homes that are better off
sum(df2$better == "Better")/nrow(df2) * 100