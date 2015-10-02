module ApplicationHelper
  def image_maps(latitude, longitude)
    url_maps = (
        "http://maps.googleapis.com/maps/api/staticmap?" +
        "center=#{latitude},#{longitude}" +
        "&zoom=16&scale=false&size=700x280&maptype=roadmap&sensor=false&format=png&visual_refresh=true&" +
        "markers=#{latitude},#{longitude}" +
        "&key=AIzaSyCC9UY8MCMY3PBx25McZ9QezjQb576djEI"
    )

    url_maps
  end
end
