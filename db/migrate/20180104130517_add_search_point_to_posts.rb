class AddSearchPointToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :search_point, :integer
  end
end
