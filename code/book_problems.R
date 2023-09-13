### Statistical Rethinking - Probabilistic Programming
## Textbook problems and questions

## Libraires
library(tidyverse)
library(rethinking)

## 2M1. Compute and plot the grid approximate posterior distribution ofr each of the following (uniform prior):
# define grid
p_grid <- seq( from=0 , to=1 , length.out=101 )
# define prior
prior <- rep( 1 , 101 )

## (a) W, W, W
# compute likelihood at each value in grid
likelihood <- dbinom(3, size=3 , prob=p_grid )
# compute product of likelihood and prior
unstd.posterior <- likelihood * prior
# standardize the posterior, so it sums to 1
posterior <- unstd.posterior / sum(unstd.posterior)
# plot
plot(p_grid, posterior, type="l" ,
      xlab="probability of water" , ylab="posterior probability" )
mtext( "W, W, W" )

plot( posterior ~ p_grid , type="l" )

## (a) W, W, W, L
# compute likelihood at each value in grid
likelihood <- dbinom(3, size=4 , prob=p_grid )
# compute product of likelihood and prior
unstd.posterior <- likelihood * prior
# standardize the posterior, so it sums to 1
posterior <- unstd.posterior / sum(unstd.posterior)
# plot
plot( p_grid , posterior , type="l" ,
      xlab="probability of water" , ylab="posterior probability" )
mtext( "W, W, W, L" )

plot( posterior ~ p_grid , type="l" )

## (a) L, W, W, L, W, W, W
# compute likelihood at each value in grid
likelihood <- dbinom(5, size=7 , prob=p_grid )
# compute product of likelihood and prior
unstd.posterior <- likelihood * prior
# standardize the posterior, so it sums to 1
posterior <- unstd.posterior / sum(unstd.posterior)
# plot
plot( p_grid , posterior , type="l" ,
      xlab="probability of water" , ylab="posterior probability" )
mtext( "L, W, W, L, W, W, W" )

plot( posterior ~ p_grid , type="l" )


## 2M2. Repeat, but with prior p=0 when p<0.5 and uniform when p>=0.5
# define prior
prior <- ifelse(p_grid < 0.5 , 0 , 1 )

## (a) W, W, W
# compute likelihood at each value in grid
likelihood <- dbinom(3, size=3 , prob=p_grid )
# compute product of likelihood and prior
unstd.posterior <- likelihood * prior
# standardize the posterior, so it sums to 1
posterior <- unstd.posterior / sum(unstd.posterior)
# plot
plot(p_grid, posterior, type="l" ,
     xlab="probability of water" , ylab="posterior probability" )
mtext( "W, W, W" )

plot( posterior ~ p_grid , type="l" )

## (a) W, W, W, L
# compute likelihood at each value in grid
likelihood <- dbinom(3, size=4 , prob=p_grid )
# compute product of likelihood and prior
unstd.posterior <- likelihood * prior
# standardize the posterior, so it sums to 1
posterior <- unstd.posterior / sum(unstd.posterior)
# plot
plot( p_grid , posterior , type="l" ,
      xlab="probability of water" , ylab="posterior probability" )
mtext( "W, W, W, L" )

plot( posterior ~ p_grid , type="l" )

## (a) L, W, W, L, W, W, W
# compute likelihood at each value in grid
likelihood <- dbinom(5, size=7 , prob=p_grid )
# compute product of likelihood and prior
unstd.posterior <- likelihood * prior
# standardize the posterior, so it sums to 1
posterior <- unstd.posterior / sum(unstd.posterior)
# plot
plot( p_grid , posterior , type="l" ,
      xlab="probability of water" , ylab="posterior probability" )
mtext( "L, W, W, L, W, W, W" )

plot( posterior ~ p_grid , type="l" )


## 2M3. Suppose two globes: Earth 70% W, Mars 100% L. If you toss the globes and get land, show:
# (Pr(Earth|land)) = 0.23
# define grid

# (Pr(Earth|land)) = Pr(land|Earth) * Pr(Earth) / Pr(land) = 0.3 * 0.5 / 0.65 (last term is joint prob)
(0.3*0.5/0.65)
# [1] 0.2307692

# Official answer - R code 1.6
0.3*0.5 / ( 0.3*0.5 + 1*0.5 )


## 2M4. 3 cards: one has 2 black sides, one has a black and a white side, and one has 2 white sides
# You pick one card, which shows black. What is the probability the other side is black?
# Use counting method.
conjecture <- c("BB", "WW", "BW")
# If we see a black card, there are 2 ways the first card could be picked, and 1 way for the third one
prior <- c(2, 0, 1)
likelihood <- c(1, 0, 1)
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(unstd.posterior)
# Answer: 2/3 (0.6667)


## 2M5. Now 4 cards: B/B, B/W, W/W, B/B. Again a black card drawn, prob the other side is black
possibilities <- c("BB", "WW", "BW")
# If we see a black card, there are 4 ways the first card could be picked, and 1 way for the third one
prior <- c(4, 0, 1)
likelihood <- c(1, 0, 1)
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(unstd.posterior)
# Answer: 4/5 (0.8)


## 2M6. 3 cards again, but less likely to pull B/B. For every B/B pulled, two ways to pull B/W, and 
# 3 ways to pull W/W. A black card is pulled. Prob that other side is black.
possibilities <- c("BB", "WW", "BW")
prior <- c(1, 3, 2)
likelihood <- c(2, 0, 1)
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(unstd.posterior)
# Answer: 2/4 (0.5)


## 2M7. Original card problem. We draw another card and get a white card. 
# What is the probability that the first card is B/B?
# Use W-L example as reference
possibilities <- c("BB", "WW", "BW")
prior <- c(2, 0, 1) # prob of getting black
likelihood <- c(3, 1, 2) # prob that remaining card is white
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(unstd.posterior)
# Answer: 6/8 (0.75)


## 2H1. 2 panda species - A births 10% twins, B births 20% twins.
# Panda gives birth to twins. What is prob that next birth is twins
possibilities <- c("a", "b")
prior <- c(1, 2)
likelihood <- c(.1, .2)
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(prior)
prob_twins <- sum(posterior)
# Answer: 5/30 = 1/6 (0.16667)

# Book answer: Pr(twins2 | twins1) = Pr(twins1, twins2) / Pr(twins)
P_twins = (0.5*0.1)+(0.5*0.2) # 0.15
joint_P_twins = (0.5*0.1*0.1)+(0.5*0.2*0.2) # 0.025
answer <- joint_P_twins/P_twins # 0.16667


## 2H2. Prob that panda is from species A if we only observed first birth
possibilities <- c("a", "b")
prior <- c(.1, .2)
likelihood <- c(1, 1)
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(unstd.posterior)
# Answer: 1/3 (0.3333)

# Book answer: Pr(A | twins1) = Pr(twins1 | A) * Pr(A) / Pr(twins)
answer <- 0.1 * 0.5 / P_twins # 0.3333


## 2H3. Second birth is singleton. What is probability it is species A?
possibilities <- c("a", "b")
prior <- c(.1, .2)
likelihood <- c(0.9, 0.8)
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(unstd.posterior)
# Answer: 0.36


## 2H4. Genetic test that can identify panda A correctly with 80% probability, 
# and panda B with 65% probability. If test identifies panda A, compute posterior 
# probability that it is panda A, on its own, and using prior info.

# Pr(A | testA) = Pr(testA | A) Pr(A) / Pr(testA)
PrtestAposta <- 0.8
Pra <- 0.5
PrtestA <- (0.5*0.8)+(0.5*0.35)
PraposttestA <- PrtestAposta*Pra/PrtestA
# Answer: 0.6956522

# Check for alternative Pr(B | testA) = Pr(testA | B) Pr(B) / Pr(testA)
PrtestApostb <- 0.35
Prb <- 0.5
PrbposttestA <- PrtestApostb*Prb/PrtestA
# 0.3043478

# Now, using prior info, compute probability
possibilities <- c("a", "b")
prior <- posterior
likelihood <- c(PraposttestA, PrbposttestA)
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(unstd.posterior)
# Answer: 0.5625

