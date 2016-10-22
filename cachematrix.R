## Put comments here that give an overall description of what your
## functions do

## the below function createa a matrix and caches its inverse. 

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The below function computes the inverse of the special "matrix" created by 
## makeCacheMatrix from the above function. 

## Here in the below example, if the above function calculates the inverse, then it will 
## the inverse from the Cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}

