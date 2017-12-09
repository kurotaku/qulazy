class Post < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  
  has_many :judges
  has_many :users, through: :judges
  has_many :goods
  has_many :good_users, through: :goods, class_name: 'Post', source: :post
  has_many :bads
  has_many :bad_users, through: :bads, class_name: 'Post', source: :post
end
