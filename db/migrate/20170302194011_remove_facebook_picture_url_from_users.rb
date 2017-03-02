class RemoveFacebookPictureUrlFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :facebook_picture_url
  end
end
