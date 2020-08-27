## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


"makeCacheMatrix, Creates a list of functions that allow us to store and read 
in cache the inverse of a matrix"
#x is by default a 3x3 matrix with a set of normal distribution values 
makeCacheMatrix <- function(x = matrix(rnorm(9), nrow=3, ncol=3)){
  i <- NULL
  
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) i <<- inverse
  get_inverse <- function() i
  
  list(set=set, get=get, 
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}


"cacheSolve, Stores and reads the inverse of a matrix using the function 
makeCacheMatrix, If it finds a value for inverse it returns it, otherwise 
it calculates the inverse and stores it in cache"
#x es la lista con las funciones generadas por makeCacheMatrix
cacheSolve <- function(x, ...){
  i<-x$get_inverse()
  'validates if there is a value for inverse stored in cache'
  if(!is.null(i)){
    message("getting cache data")
    return (i)
  }
  'If there is not a value stored in cache it computes and saves it into the cache'
  matrix <- x$get()
  i <- solve(matrix)
  x$set_inverse(i)
  i
}

"Just a function to call and test the previous defined functions"
useMyCacheInverse <- function(){
  makematrixfunc <- makeCacheMatrix()
  
  message("Original Matrix")
  print(makematrixfunc$get())
  
  message("Inverse Matrix without cache")
  print(cacheSolve(makematrixfunc))
  
  message("Getting inverse from cache")
  print(cacheSolve(makematrixfunc))
  
}

"Just a call for my cache storing logic test"
useMyCacheInverse()
