
#' Detect a series of change points with binary segmentation
#'
#' Detect a series of change points with binary segmentation and return the points and costs
#'
#' @param data a vector of data
#' @param segs the number of segments
#'
#' @return a data matrix of the change points and costs
#' @export
#' @examples
#' Rfunc2::BINSEG(c(1,2,3,4,5,6),2)



BINSEG <- function(data, segs){

  change.points <- vector(length = segs+1)
  cost.reductions <- vector(length = segs+1)

  change.points[1] <- 0
  cost.reductions[1] <- 0

  for(i in 1:segs){
    best.reduction <- 0
    best.change.point <- 0
    change.points[i+1] <- length(data)

    temp.sort <- sort(change.points[1:i], index.return = TRUE)
    indexs <- temp.sort$ix
    change.points[1:i] <- temp.sort$x

    temp.vec <- vector(length=i)
    count <- 0
    for(t in 1:i){
      count <- count + 1
      temp.vec[count] <- cost.reductions[indexs[t]]
    }
    cost.reductions[1:i] <- temp.vec

    for(j in 1:i){
      results <- CHANGEPOINT(data[change.points[j]:change.points[j+1]])
      if(results[2] > best.reduction){
        best.reduction <- results[2]
        best.change.point <- results[1] + change.points[j]
      }
    }
    change.points[i+1] <- best.change.point
    cost.reductions[i+1] <- best.reduction
  }
  table <- cbind(change.points[-1], cost.reductions[-1])
  return(table)

}
