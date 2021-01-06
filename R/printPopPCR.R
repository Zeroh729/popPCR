#' Print result summary of popPCR
#'
#' @param result.popPCR returned value of popPCR()
#' @export
printSummaryConc <- function(result.popPCR){
  r <- result.popPCR
  posPct <- round(r@dropletCount$pos / r@dropletCount$total*100, 2)
  negPct <- round(r@dropletCount$neg / r@dropletCount$total*100, 2)

  lamb <- sapply(r@estConc$lambda, round, 4)
  conc <- sapply(r@estConc$conc, round, 4)

  summaryRain <- ""
  for(rain in levels(r@classification)[grepl("rain", levels(r@classification))]){
    i <- gsub("rain", "", rain)
    rainPct <- round(r@dropletCount[[rain]] / r@dropletCount$total*100, 2)
    summaryRain <- paste0(summaryRain, "Rain (", i, ") : ", sum(r@dropletCount[[rain]]), " (",rainPct,"%)\n      ")
  }

  cat(paste0("
      Populations detected : ", r@G, "
      Total droplets : ", r@dropletCount$total, "
      Positive : ", r@dropletCount$pos, " (",posPct,"%)
      Negative : ", r@dropletCount$neg, " (",negPct,"%)
      ",summaryRain,"
      Target copies in sample          : ", conc[['conc']],  " ( 95% CI: [ ", conc[['lower']]," , ", conc[['upper']]," ] )
      Mean target copies per partition : ", lamb[['lambda']]," ( 95% CI: [ ", lamb[['lower']]," , ", lamb[['upper']]," ] )
      "))
}

#' Print fitted mixture model estimates from popPCR
#'
#' @param result.popPCR returned value of popPCR()
#' @export
printSummaryFit <- function(result.popPCR){
  r <- result.popPCR

  cat(paste0("Results of fitting a ", r@G ,"-component ", r@dist, " mixture model"))

  hasDelta <- r@em$distr == "msn" || r@em$distr == "mst"
  hasDof   <- r@em$distr == "mvt" || r@em$distr == "mst"
  for(i in 1:r@G){
    if(i == 1){
      popn <- "Negative Population"
    }else if(i == r@G){
      popn <- "Positive Population"
    }else{
      popn <- paste0("Rain (", i-1, ") Population")
    }
    cat(paste0("

      ",popn,"
        Mix prop. : ", round(r@em$pro[i],4),"
        Mu        : ", round(r@em$mu[i],4),"
        Sigma     : ", round(r@em$sigma[i],4)))

    if(hasDof)   cat(paste0("\n        Dof       : ", round(r@em$dof[i],4)))
    if(hasDelta) cat(paste0("\n        Delta     : ", round(r@em$delta[i],4)))
  }
}
