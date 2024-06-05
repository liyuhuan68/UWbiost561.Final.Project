#' Calculate the maximum G value for a given time sequence
#'
#' Calculate the maximum G value for a given time sequence `xt` using the specified number of observations `n` based on CUSUM process and normalized process.
#'
#' @param xt A time series sequence.
#' @param n Number of observations.
#' @return The maximum G value.
#' @export
Gn_statistics <- function(xt,n){
  G <- vector(mode="numeric",length=0)
  for (k in 1:n-1) {
    G[k] <- (CUSUM_process_Tnk(xt,n,k) ^ 2) / Normalization_process_Vnk(xt,n,k)
  }
  G_sup <- max(G)
  return(G_sup)
}
