module PostsHelper
  
  def name_scan(x)
    r = x.name
    s = x.name.length
    n = 8
    s_name = r.scan(/.{1,#{n}}/).join(' ')
    return s_name
  end  
end
