module ApplicationHelper
  def image_maps(latitude, longitude, mobile=false)
    key_mobile = "AIzaSyDWQW6g_ZXa_pANLFoAHFaK8oC6KOGKU4U"
    key_web = "AIzaSyCC9UY8MCMY3PBx25McZ9QezjQb576djEI"
    key = nil

    if mobile
      key = key_mobile
    else
      key = key_web
    end

    url_maps = (
        "http://maps.googleapis.com/maps/api/staticmap?" +
        "center=#{latitude},#{longitude}" +
        "&zoom=16&scale=false&size=700x280&maptype=roadmap&sensor=false&format=png&visual_refresh=true&" +
        "markers=#{latitude},#{longitude}" +
        "&key=#{key}"
    )

    url_maps
  end

  def canonical_url
    url_for(only_path: false, overwrite_params: nil)
  end
end
