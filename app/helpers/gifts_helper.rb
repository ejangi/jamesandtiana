module GiftsHelper
  
  def photo_tag(gift, size=:onehundred)
    url = gift.photo_url(size).to_s
    if url.blank?
      url = image_path("gift.photo.#{size}.jpg")
    end
    
    return image_tag(url, :alt => gift.title)
  end
  
  # def options_for_contribution_amount(gift, contribution)
  #     string = ""
  #     q = gift.contribution_quantity_remaining
  #     (1..q).to_a.each do |n| 
  #       price = number_to_currency(gift.price * n)
  #       string << "<option value=\"#{price}\">#{n} — #{price}</option>"
  #     end
  #     return string.html_safe
  #   end
  
end
