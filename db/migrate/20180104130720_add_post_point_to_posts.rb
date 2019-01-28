class AddPostPointToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_point, :integer
  end
end
