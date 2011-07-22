module ApplicationHelper
  
  def registry_home_path(registry)
    if !current_user_session
      return "/#{registry}"
    else
      return "/#{registry}/information"
    end
  end
  
end
