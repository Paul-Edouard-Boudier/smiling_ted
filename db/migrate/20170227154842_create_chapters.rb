class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.string :localisation
      t.integer :likes

      t.timestamps
    end
  end
end
