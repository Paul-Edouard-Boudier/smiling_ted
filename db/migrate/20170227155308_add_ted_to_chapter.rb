class AddTedToChapter < ActiveRecord::Migration[5.0]
  def change
    add_reference :chapters, :ted, foreign_key: true
  end
end
