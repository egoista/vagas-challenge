class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.references :first_location, foreign_key: {to_table: :locations}
      t.references :second_location, foreign_key: {to_table: :locations}
      t.integer :distance
      
      t.timestamps
    end
  end
end
