class People < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |col|
      col.string :name, null: false
      col.integer :house_id,
      col.timestamps
    end
  end
end
