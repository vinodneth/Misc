library(leaflet)
my_map<-leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lat=27.1750, lng=78.0422, popup="Taj Mahal, India")
my_map
