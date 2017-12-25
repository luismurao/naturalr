if (base::getRversion() >= "2.15.1") {
  utils::globalVariables(c("long", "lat","group","Longitude","Latitude"))
  long <- lat <- Longitude <- Latitude <- NULL
}
