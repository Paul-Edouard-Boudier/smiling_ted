class CreateTeds < ActiveRecord::Migration[5.0]
  def change
    create_table :teds do |t|
      t.string :name
      t.integer :unique_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
