varp <- function(X){
  data <- var(X) * (length(X)-1) / length(X)
  data
}