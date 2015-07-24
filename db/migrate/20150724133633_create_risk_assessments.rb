class CreateRiskAssessments < ActiveRecord::Migration
  def change
    create_table :risk_assessments do |t|
      t.integer :user_id
      t.integer :level
      t.references :risk_assessable, polymorphic: true
      t.boolean  :current
      t.timestamps
    end
  end
end
