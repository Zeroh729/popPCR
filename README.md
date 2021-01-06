# popPCR

R package for fitting droplet fluorescence populations of dPCR amplitude data using Expectation Maximization.

## Installation

Install from GitHub

```r
library(devtools)
install_github("Zeroh729/popPCR")
```

## Usage

```r
library(popPCR)
result <- popPCR(x_twoPop, dist = "t")
printSummaryConc(result)
#        Populations detected : 2
#        Total droplets : 10254
#        Positive : 8693 (84.78%)
#        Negative : 1561 (15.22%)
#
#        Target copies in sample          : 44290.3819 ( 95% CI: [ 43215.6408 , 45365.1231 ] )
#        Mean target copies per partition : 1.8823 ( 95% CI: [ 1.8367 , 1.928 ] )
printSummaryFit(result)
#        Results of fitting a 2-component t mixture model
#
#        Negative Population
#        Mix prop. : 0.1522
#        Mu        : 2136.7435
#        Sigma     : 4126.8357
#        Dof       : 12.3562
#
#        Positive Population
#        Mix prop. : 0.8478
#        Mu        : 7580.1275
#        Sigma     : 42621.1894
#        Dof       : 2.415
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[GNU GPLv3.0](https://choosealicense.com/licenses/gpl-3.0/)
