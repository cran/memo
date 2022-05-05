## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(cache=FALSE)

## -----------------------------------------------------------------------------
fib <- function(n) if (n <= 1) 1 else fib(n-1) + fib(n-2)
sapply(0:9, fib)

## -----------------------------------------------------------------------------
count <- 0
fib <- function(n) {
  count <<- count+1
  if (n <= 1) 1 else fib(n-1) + fib(n-2)
}

counted_fib <- function(n) {
  count <<- 0
  c(n=n, result=fib(n), calls=count)
}

t(sapply(0:16, counted_fib))

## -----------------------------------------------------------------------------
library(memo)

count <- 0
fib <- memo(function(n) {
  count <<- count+1
  if (n <= 1) 1 else fib(n-1) + fib(n-2)
})

counted_fib(16)

## -----------------------------------------------------------------------------
counted_fib(16)

## -----------------------------------------------------------------------------
t(sapply(17:30, counted_fib))

## ----eval=FALSE---------------------------------------------------------------
#  fib <- memo(cache=lru_cache(5000), function () {...})

