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
puma_occs <- get_inat_obs(query = "Puma concolor",
                          geo = T,maxresults = 10000,
                          captive_cultivated = F)

inat_map(puma_occs)

```

![](img/puma_concolor.png)
