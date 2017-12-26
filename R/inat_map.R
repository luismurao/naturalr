#' Plot iNaturalist observations
#'
#' @description Plot observations from iNaturalist for Mexico.
#' @param data data frame of iNaturalist observations
#' @param imgPreview Logical if TRUE the image of the record will be shown.
#' @return a leaflet map object
#' @examples \dontrun{
#' puma_occs <- get_inat_obs(query = "Puma concolor",
#'                           geo = T,maxresults = 10000,
#'                          captive_cultivated = F)
#' inat_map(puma_occs, imgPreview=TRUE)
#'
#' }
#' @import leaflet leaflet
#' @export

inat_map <- function(data,imgPreview=T){
  if(is.data.frame(data)){
    data$sp_info <- paste0("https://es.wikipedia.org/wiki/",
                           gsub(x = data$scientific_name[1],pattern = " ",
                                replacement = "_"))
    if(imgPreview){
      data$data_rowID <- paste("<b>Species: </b><a href='",data$sp_info,"'>",
                               data$scientific_name,"</a><br/>",
                               "<b>rowID:</b>",1:dim(data)[1],
                               "<br/><b>observed on: </b>",
                               data$observed_on,
                               "<br/><b>captive or cultivated:</b>",
                               data$captive_cultivated,
                               "<br/><b>Record url: </b><a href='",data$url,
                               "'>click</a>",
                               "<br/><b>Image preview:<br/></b><a href='",
                               data$image_url,
                               "'><div style='text-align: center;'><img src='",
                               data$image_url,
                               "' height='72' width='72' align='middle'></div></a>")
    }
    else{
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
                               "'>click, </a>")
    }

    m <- leaflet(data) %>%
      addTiles() %>%  # Add default OpenStreetMap map tiles
      addMarkers(lng=~longitude, lat=~latitude,
                 popup= ~data_rowID);
    return(m)

  }

}


