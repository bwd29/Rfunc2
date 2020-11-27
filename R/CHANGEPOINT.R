
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
