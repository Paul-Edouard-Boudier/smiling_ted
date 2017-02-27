class RemoveUniqueIdFromTed < ActiveRecord::Migration[5.0]
  def change
    remove_column :teds, :unique_id
    add_column :teds, :code, :string
  end
end

