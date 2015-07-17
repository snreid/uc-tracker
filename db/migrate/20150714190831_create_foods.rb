class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :usda_ndbno
      t.integer :user_id

      t.timestamps
    end
  end
end
