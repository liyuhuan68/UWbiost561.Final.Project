#' CUSUM process for a given time series data
#'
#' Calculate the cumulative sum (CUSUM) process for a given time sequence `xt`.
#'
#' @param xt A time sequence.
#' @param n Number of observations.
#' @param k End time.
#' @return A normalized CUSUM value.
#'
#' @export
CUSUM_process_Tnk <- function(xt,n,k){
  Tn <- 0
  for (t in 1:k) {
    Tn <- xt[t]- mean(xt) +Tn
  }
  Tn <- Tn/sqrt(n)
  return(Tn)
}
