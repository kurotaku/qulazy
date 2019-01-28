class CreateNotFounds < ActiveRecord::Migration[5.1]
  def change
    create_table :not_founds do |t|

      t.timestamps
    end
  end
end
