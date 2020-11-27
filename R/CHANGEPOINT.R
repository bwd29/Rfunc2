
#' Detect a changepoint
#'
#' Detect a Changepoint in a vector using sum of squares as a cost
#'
#' @param data a vector of data
#'
#' @return the change point location and the reduction in cost
#' @export
#' @examples
#' Rfunc2::CHANGEPOINT(c(1,2,3,4,5,6))


CHANGEPOINT <- function(data){
  N.points <- length(data)
  lowest.cost <- sum((mean(data)-data)^2)
  change.point <- 0
  for(p in 1:N.points){
    first.mean <- mean(data[1:p])
    second.mean <- mean(data[p:N.points])
    sum.squares <- sum((first.mean - data[1:p])^2) + sum((second.mean - data[p:N.points])^2)
    if(lowest.cost > sum.squares){
      lowest.cost <- sum.squares
      change.point <- p
    }
  }
  reduction <- sum((mean(data)-data)^2) - lowest.cost
  results <- c(change.point, reduction)
  return(results)
}
