## Caching the Inverse of a Matrix

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x=matrix()) {
  m <-NULL
  set <-function(y) {
    x <<- y
    m <<- NULL
  }
  get <-function() x
  setinversematrix <- function(cacheSolve) m <<- cacheSolve
  getinversematrix <- function() m
  list(set = set, get=get,
       setinversematrix = setinversematrix,
       getinversematrix = getinversematrix)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has
## already been calculated (and the matrix has not changed), then the cacheSolve should retrieve the inverse from the
##cache.

cacheSolve <- function(x,...) {
  m <-x$getinversematrix()
  if(!is.null(m)) {
    message("getting cached data")
    return (m)
  }
  data <- x$get()
  m <- cacheSolve(data,...)
  m
}