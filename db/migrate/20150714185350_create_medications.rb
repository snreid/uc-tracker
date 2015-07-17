class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dosage
      t.string :frequency
      t.integer :user_id

      t.timestamps
    end
  end
end
