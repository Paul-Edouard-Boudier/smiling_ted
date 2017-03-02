class AddCoordinatesToTed < ActiveRecord::Migration[5.0]
  def change
    add_column :teds, :latitude, :float
    add_column :teds, :longitude, :float
  end
end
