class AddCountryToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :country, :string
  end
end
