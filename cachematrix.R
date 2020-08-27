## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

"makeCacheMatrix, crea una lista de funciones que permiten almacenar y leer 
en cache la inversa de una matriz"
#x es por defecto una matriz de 3 x 3 con valores de una distribución normal
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

"cacheSolve, guarda y lee la inversa de una matriz, usando la funcion 
makeCacheMatriz, sí encuentra un valor en la cache para la inversa lo retorna 
en lugar de calcular de nuevo."
#x es la lista con las funciones generadas por makeCacheMatrix
cacheSolve <- function(x, ...){
  i<-x$get_inverse()
  'Valida sí hay la inversa está en cache'
  if(!is.null(i)){
    message("getting cache data")
    return (i)
  }
  'sí la inversa no está en la cache la calcula y la guarda en cache'
  matrix <- x$get()
  i <- solve(matrix)
  x$set_inverse(i)
  i
}

"Función para usar la lógica de guardado en cache de la inversa"
useMyCacheInverse <- function(){
  makematrixfunc <- makeCacheMatrix()
  
  message("Original Matrix")
  print(makematrixfunc$get())
  
  message("Inverse Matrix without cache")
  print(cacheSolve(makematrixfunc))
  
  message("Getting inverse from cache")
  print(cacheSolve(makematrixfunc))
  
}

useMyCacheInverse()
