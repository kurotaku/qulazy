module UsersHelper
  
  def good_calc(user)
    total = 0
    user.posts.each do |post|
      total += post.good_users.count
    end
    return total
  end
  
  def bad_calc(user)
    total = 0
    user.posts.each do |post|
      total += post.bad_users.count
    end
    return total
  end
  
  def post_point_calc(user)
    user.posts.sum(:post_point)
  end
  
  def point_total(user)
    post_point_calc(user) + good_calc(user) - bad_calc(user)
  end
  
end
