## the aim of this function is to cache first the infos a a matrix to the n solve it. It is very similar to the example of cache mean.

## The first function, makeVector creates a special "vector", which is really a list containing a function to

 	 ##set the value of the vector
    ##get the value of the vector
    ##set the inverse vector
    ##get the inverse vector

makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL   }
      get <- function() x
      setinverse <- function(solve) m <<- solve
      getinverse <- function() m
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)}
}


## The following function calculates the inverse of the matrice using the data stored in th espcial vector created with the above function. However, it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. Otherwise, it solve the equation and sets the value of theinvert matrix  in the cache via the setmean function.

cacheSolve <- function(x,...) {
        m <- x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data)
      x$setinverse(m)
      m
}
