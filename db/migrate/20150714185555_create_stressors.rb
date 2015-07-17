class CreateStressors < ActiveRecord::Migration
  def change
    create_table :stressors do |t|
      t.string :name
      t.integer :user_id
      
      t.timestamps
    end
  end
end
