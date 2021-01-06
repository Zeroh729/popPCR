#' Target copies estimation
#'
#' Mean target copies per partition (lambda) is derived using Poisson distribution as lambda = -ln(nneg / ntot). Target copies in sample is then calculated as conc = lambda * volSamp/(volDrp * 1000).
#'
#' @param nneg numerical, negative droplet count
#' @param ntotal numerical, total droplet count
#' @param volSamp numerical, sample volume in microliter
#' @param volDrp  numerical, droplet (or partition) volume in nanoliter
#' @export
#' @examples
#'
calculateConc <- function(nneg, ntotal, volSamp, volDrp){
  res <- list()

  lambda <- -log(nneg/ntotal)
  lambda_lo <- lambda - 1.96 * sqrt((ntotal - nneg)/(ntotal * nneg))
  lambda_up <- lambda + 1.96 * sqrt((ntotal - nneg)/(ntotal * nneg))
  res$lambda <- c(lambda, lambda_up, lambda_lo)
  names(res$lambda) <- c("lambda", "upper", "lower")

  conc <- lambda * volSamp/volDrp * 1000
  conc_lo <- lambda_lo * volSamp/volDrp * 1000
  conc_up <- lambda_up * volSamp/volDrp * 1000
  res$conc <- c(conc, conc_up, conc_lo)
  names(res$conc) <- c("conc", "upper", "lower")
  return(res)
}
