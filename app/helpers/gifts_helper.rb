module GiftsHelper
  
  def photo_tag(gift, size=:onehundred)
    url = gift.photo_url(size).to_s
    if url.blank?
      url = image_path("gift.photo.#{size}.jpg")
    end
    
    return image_tag(url, :alt => gift.title)
  end
  
end
