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


## 2M4.
