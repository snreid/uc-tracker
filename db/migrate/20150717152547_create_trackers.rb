class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.integer :user_id
      t.references :trackable, polymorphic: true, index: true
      t.datetime  :tracked_date

      t.timestamps
    end
  end
end
