module ApplicationHelper
  
  def public?
    if !Rails.env.production? || (!current_user.nil? && current_user.role_symbols.include?(:admin))
      return true
    end
    
    today = DateTime.now
    release = DateTime.parse("2011-08-10 23:59:00")
    return (today == release)
  end
  
  def mainmenu
    string = ''
    registries = Registry.list
    
    registries.each do |registry|
      image = registry.title.to_s.downcase.gsub(/[^a-z0-9]/, '.')
      date = l registry.when, :format => :short
      string << "<div id=\"menu-#{registry.permalink}\""
      string << "class=\"active\"'".html_safe if is_registry?(registry.permalink)
      string << ">"
      string << link_to("<span class=\"title\"><img src=\"/images/#{image}.png\" alt=\"#{registry.title}\" /></span><span class=\"date\">#{date}</span>".html_safe, celebration_home_path(registry))
      string << "</div>\n\t\t\t\t\t"
    end

    return string.html_safe
  end
  
  def celebration_home_path(registry)
    if !current_user_session
      return introduction_celebration_path(registry)
    else
      return celebration_path(registry)
    end
  end
  
  def is_registry?(registry=nil)
    if !@registry.nil? && (@registry.permalink == registry.to_s.downcase)
      true
    elsif registry.nil? && !@registry.nil? && (Registry.permalink_list.include?(@registry.permalink))
      true
    else
      false
    end
  end
  
  def display_home?
    return !current_page?(root_path)
  end
  
  def image_url(source)
    abs_path = image_path(source)
    unless abs_path =~ /^http/
      abs_path = "#{request.protocol}#{request.host_with_port}#{abs_path}"
    end
   return abs_path
  end
  
  def notices?
    flash[:notice] || flash[:error]
  end
  
  def notices
    notices = ""
    notices << "#{flash[:error]}\n" if flash[:error]
    notices << "#{flash[:notice]}\n" if flash[:notice]
    return simple_format(notices)
  end
  
end
