class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :titre
      t.string :description
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
