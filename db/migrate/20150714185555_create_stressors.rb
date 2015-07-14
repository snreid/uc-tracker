class CreateStressors < ActiveRecord::Migration
  def change
    create_table :stressors do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
