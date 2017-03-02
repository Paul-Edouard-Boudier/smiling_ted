class AddCoordinatesToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :latitude, :float
    add_column :chapters, :longitude, :float
  end
end
