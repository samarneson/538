##################################################################
### Puzzle Date: 2020.03.13
### Puzzle Name: Can You Get Another Haircut Already?
### Version: Express
### Date Created: 2020.03.21
##################################################################

### Create loop to find first instance where 2^i is less than 2.4% from a nearby 10^j
for (i in 11:100){    # i represents powers of 2
  for (j in 3:30){    # j represents powers of 10
    if(abs(2**i - 10**j)/10**j < .024){
      print(i)
      print(j)
      break
    }
  }
}