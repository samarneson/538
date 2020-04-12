##################################################################
### Puzzle Date: 2020.03.20
### Puzzle Name: How Many Sets Of Cards Can You Find?
### Version: Express
### Date Created: 2020.03.21
##################################################################

### Walkthrough of math
price <- 100
  # multiply in order (*0.9 first, then *1.1)
  price2 <- price*.9
  price2 <- price2*1.1
  price2

  # try multiplying all at once
  price3 <- price*.9*1.1
  price3

  # confirm they match
  price3 == price2 # This is TRUE, we can combine 0.9 and 1.1 into 0.9*1.1, which is 0.99
  
  # basic equation: ((.99)^i) * price < 0.50 * price
  # find the value "i" that makes this true

### Create loop to increase "i" until 0.99^i is less than 0.50
for (i in 1:100) {
  if(.99**i < .50){
    print(i)
    break
  }
}