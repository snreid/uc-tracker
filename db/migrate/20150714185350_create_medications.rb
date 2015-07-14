class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dosage
      t.string :frequency

      t.timestamps
    end
  end
end
