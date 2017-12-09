class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :posts
  has_many :judges
  has_many :goods
  has_many :good_posts, through: :goods, class_name: 'Post', source: :post
  has_many :bads
  has_many :bad_posts, through: :bads, class_name: 'Post', source: :post
  
  def good(post)
    self.goods.find_or_create_by(post_id: post.id)
  end
  
  def ungood(post)
    good = self.goods.find_by(post_id: post.id)
    good.destroy if good
  end
  
  def good?(post)
    self.good_posts.include?(post)
  end
  
  def bad(post)
    self.bads.find_or_create_by(post_id: post.id)
  end
  
  def unbad(post)
    bad = self.bads.find_by(post_id: post.id)
    bad.destroy if bad
  end
  
  def bad?(post)
    self.bad_posts.include?(post)
  end
  
end
