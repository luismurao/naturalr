#' Plot iNaturalist observations
#'
#' @description Plot observations from iNaturalist for Mexico.
#' @param data data frame of iNaturalist observations
#'
#' @return a leaflet map object
#' @examples \dontrun{
#'   m_obs <- get_inat_obs(taxon="Ambystoma maculatum")
#'   salamander_map <- inat_map(m_obs,plot=FALSE)
#'   ### Now we can modify the returned map
#'   salamander_map + borders("state") + theme_bw()
#' }
#' @import leaflet leaflet
#' @export

inat_map <- function(data){
  if(is.data.frame(data)){
    data$sp_info <- paste0("https://es.wikipedia.org/wiki/",
                           gsub(x = data$scientific_name[1],pattern = " ",
                                replacement = "_"))
    data$data_rowID <- paste("<b>Species: </b><a href='",data$sp_info,"'>",
                             data$scientific_name,"</a><br/>",
                             "<b>rowID:</b>",1:dim(data)[1],
                             "<br/><b>observed on: </b>",
                             data$observed_on,
                             "<br/><b>captive or cultivated:</b>",
                             data$captive_cultivated,
                             "<br/><b>Record url: </b><a href='",data$url,
                             "'>click</a>",
                             "<br/><b>Image url: </b><a href='",data$image_url,
                             "'>click, </a><br/>")
    m <- leaflet(data) %>%
      addTiles() %>%  # Add default OpenStreetMap map tiles
      addMarkers(lng=~longitude, lat=~latitude, popup= ~data_rowID)
    return(m)  # Pr
  }

}


