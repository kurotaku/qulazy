class AddTitleToNotFounds < ActiveRecord::Migration[5.1]
  def change
    add_column :not_founds, :title, :string
  end
end
