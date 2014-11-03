module ApplicationHelper
  
  def set_latitude_longitude(lat,long)
    session[:latitude] = lat.to_s
    session[:longitude] = long.to_s
  end
  
end
