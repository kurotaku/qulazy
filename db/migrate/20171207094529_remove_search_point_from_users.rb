class RemoveSearchPointFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :search_point, :integer
  end
end
