module ApplicationHelper
  def image_maps(latitude, longitude)
    url_maps = (
        "http://maps.googleapis.com/maps/api/staticmap?" +
        "center=#{latitude},#{longitude}" +
        "&zoom=16&scale=false&size=700x380&maptype=roadmap&sensor=false&format=png&visual_refresh=true&" +
        "markers=#{latitude},#{longitude}" +
        "&key=AIzaSyCoX0HCJcBzPkCIo0XAuS7xbLhJCe8qSPs"
    )

    url_maps
  end
end
