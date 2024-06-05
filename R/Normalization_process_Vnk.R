#' Normalized process V with a given time series sequence
#'
#' Normalized process V with a given time series sequence `xt` using the specified parameters.
#'
#' @param xt A time series sequence.
#' @param n Number of observations.
#' @param k Number of time points in the normalization process.
#' @return The normalized variance.

#' @export
Normalization_process_Vnk <- function(xt,n,k){
  V_1 <- 0
  for (t in 1:k) {
    V_1 <- V_1 + (SN(xt,1,t) - (t/k)*SN(xt,1,k)) ^ 2
  }
  V_2 <- 0
  for (t in (k+1):n) {
    V_2 <- V_2 + (SN(xt,t,n) - (n-t+1)/(n-k)*SN(xt,k+1,n)) ^ 2
  }
  V <- (V_1 + V_2) / (n ^ 2)
  return(V)
}
