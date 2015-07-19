class AddDetailsToFood < ActiveRecord::Migration
  def change
    add_column :foods, :serving_size, :string
    add_column :foods, :calories, :string
    add_column :foods, :fat, :string
    add_column :foods, :carbohydrates, :string
    add_column :foods, :protein, :string
    add_column :foods, :fiber, :string
    add_column :foods, :sodium, :string
    add_column :foods, :sugars, :string
  end
end
