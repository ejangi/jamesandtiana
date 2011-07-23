module ApplicationHelper
  
  def public?
    today = DateTime.now
    release = DateTime.parse("2011-08-10 23:59:00")
    return (Rails.env.production? && today == release)
  end
  
  def registry_home_path(registry)
    if !current_user_session
      return "/#{registry}"
    else
      return "/#{registry}/information"
    end
  end
  
  def is_registry?(registry=nil)
    if !@registry.nil? && (@registry.title.to_s.downcase == registry.to_s.downcase)
      true
    elsif registry.nil? && !@registry.nil? && (Registry.titles_list.include?(@registry.title))
      true
    else
      false
    end
  end
  
  def display_home?
    return !current_page?(root_path)
  end
  
end
