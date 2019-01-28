class AddPointToNotFounds < ActiveRecord::Migration[5.1]
  def change
    add_column :not_founds, :point, :integer
  end
end
