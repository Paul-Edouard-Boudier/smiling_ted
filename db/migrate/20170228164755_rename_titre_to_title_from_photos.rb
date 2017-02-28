class RenameTitreToTitleFromPhotos < ActiveRecord::Migration[5.0]
  def change
    rename_column :photos, :titre, :title
  end
end
