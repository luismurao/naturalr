% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inat_map.R
\name{inat_map}
\alias{inat_map}
\title{Plot iNaturalist observations}
\usage{
inat_map(data, imgPreview = T)
}
\arguments{
\item{data}{data frame of iNaturalist observations}

\item{imgPreview}{Logical if TRUE the image of the record will be shown.}
}
\value{
a leaflet map object
}
\description{
Plot observations from iNaturalist for Mexico.
}
\examples{
\dontrun{
puma_occs <- get_inat_obs(query = "Puma concolor",
                          geo = T,maxresults = 10000,
                         captive_cultivated = F)
inat_map(puma_occs, imgPreview=TRUE)

}
}
