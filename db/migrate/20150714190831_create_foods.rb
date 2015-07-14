class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :usda_ndbno

      t.timestamps
    end
  end
end
