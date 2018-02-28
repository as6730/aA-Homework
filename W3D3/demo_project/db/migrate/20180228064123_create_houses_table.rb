class CreateHousesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |col|
      col.string :address, null: false
      col.timestamps
    end
  end
end
