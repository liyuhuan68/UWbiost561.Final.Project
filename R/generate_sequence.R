#' Generate a sequence of G values
#'
#' Generate a sequence of G values based on the specified parameters.
#'
#' @param phi A numeric value representing the correlation parameter between two contious observations.
#' @param lambda A numeric value representing the place where chang point happens.
#' @param eta A numeric value representing the constants when generating 'yt' based on 'xt'.
#' @return A vector of G values.
#'
#' @examples
#' generate_sequence(phi = 0.5, lambda = 0.2, eta = 1)
#'
#' @export
generate_sequence <- function(phi,lambda,eta){
  G <- vector(mode="numeric",length=0)
  for (i in 1:50) {
    epsilon <- rnorm(100)
    xt <- c(epsilon[1])#x0=0
    yt <- ifelse(1 > 100*lambda, xt + eta,xt)
    for (t in 2:100) {
      xt[t] <- xt[t-1] * phi + epsilon[t]
      if (t >= 100*lambda) {
        yt[t] <- xt[t] + eta
      }else{
        yt[t] <- xt[t]
      }
    }
    G[i] <- Gn_statistics(xt,100)
  }
  return(G)
}
