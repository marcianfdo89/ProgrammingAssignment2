makeCacheMatrix<- function (x=matrix){
cache<-NULL  	## storing the cache value and initialize to NULL
set <-function (matrix){ # creating the matrix in the working environment
x<<-matrix
cache<<-NULL
}
get<- function(){x}## Method the get the matrix and return matrix

setInverse<-function(inverse){ ## setting the invert matrix and storing in cache
cache<<-inverse}
getInverse<- function()## get the inverted matrix from cache
{
cache}
##return the created functions to the working environment
list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}

##Compute the inverse of the unique matrix back by "makeCacheMatrix"
cacheSolve <- function(x) {
cache<-x$getInverse()## return inverted matrix from cache if it exists
        	         ## else create the matrix in working environment
if(!is.null(cache)){
message("getting cache data")
return(cache)}
data<-x$get()##create matrix since it does not exist
cache<-solve(data)## Compute the inverse 
x$setInverse(cache)##Set the inverse to the cache
cache}