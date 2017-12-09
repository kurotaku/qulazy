class CreateJudges < ActiveRecord::Migration[5.1]
  def change
    create_table :judges do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :post_id, :type], unique: true
    end
  end
end
