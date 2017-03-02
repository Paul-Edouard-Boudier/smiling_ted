class AddLocationToTed < ActiveRecord::Migration[5.0]
  def change
    add_column :teds, :location, :string
  end
end
