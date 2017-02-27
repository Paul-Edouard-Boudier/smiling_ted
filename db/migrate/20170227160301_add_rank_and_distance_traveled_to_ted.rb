class AddRankAndDistanceTraveledToTed < ActiveRecord::Migration[5.0]
  def change
    add_column :teds, :rank, :integer
    add_column :teds, :distance_traveled, :integer
  end
end
