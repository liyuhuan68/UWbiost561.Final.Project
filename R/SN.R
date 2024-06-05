#' SN based test
#'
#' Calculate the sum of elements in the vector `xt` from time point `t1` to `t2`.
#'
#' @param xt A time series sequence.
#' @param t1 Start time point (inclusive).
#' @param t2 End time point (inclusive).
#' @return The sum of elements in the specified range.
#'
#' @export
SN <- function(xt,t1,t2){
  s <- 0
  if (t1 < t2) s <- sum(xt[t1:t2])
  return(s)
}
