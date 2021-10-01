module PostsHelper
  
  def name_scan(x)
    a = x.name
    n = 8
    s_name = a.scan(/.{1,#{n}}/).join(' ')
    return s_name
  end  
end
