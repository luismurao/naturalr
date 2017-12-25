## naturalr

Access [naturalista](http://www.naturalista.mx/) data from Mexico through APIs.

## Install

Install the development version using `install_github` within Hadley's [devtools](https://github.com/hadley/devtools) package.

```r
install.packages("devtools")
require(devtools)

devtools::install_github("naturalr", "luismurao")
```
## Usage

```r
library(naturalr)
```
Look for cougar records in Mexico that are not from captivity sites.
```r
puma_occs <- get_inat_obs(query = "Puma concolor",
                          geo = T,maxresults = 10000,
                          captive_cultivated = F)
```
Plot a leaflet map that displays basic information like species description and naturalita photos.

``` r
inat_map(puma_occs)

```

![](img/puma_concolor.png)

