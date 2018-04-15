GmapCoordinatesPicker.configure do |config|
  config.lat_column = :latitude
  config.lng_column = :longitude
  config.default_coordinates = [37.3351153, -121.881114] #SJSU Campus
  config.map_handler = 'gMapObj' #javascript map object
  config.zoom_level = 10
  config.map_container_class = 'gmap_coordinate_picker_container'
  config.map_width = '600px'
  config.map_height = '400px'
end
