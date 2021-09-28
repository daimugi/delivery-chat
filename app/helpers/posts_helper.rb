module PostsHelper
  
  def post_distance(user)
    # @posts = Post.all
    # @posts.each do |post|
    lat1 = current_user.latitude
    lng1 = current_user.longitude
    lat2 = user.latitude
    lng2 = user.longitude
    
    x1 = lat1.to_f * Math::PI / 180
    y1 = lng1.to_f * Math::PI / 180
    x2 = lat2.to_f * Math::PI / 180
    y2 = lng2.to_f * Math::PI / 180
    
    radius = 6378.137
    
    diff_y = (y1 - y2).abs
    
    calc1 = Math.cos(x2) * Math.sin(diff_y)
    calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)
    
    numerator = Math.sqrt(calc1 ** 2 + calc2 ** 2)
    
    denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)
    
    degree = Math.atan2(numerator, denominator)
    
    # @distance = "#{(degree * radius).round(1)} km"
    @p_distance = (degree * radius).round(1)
    # end
  end  
end
