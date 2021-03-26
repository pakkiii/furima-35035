class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                     null: false  
      t.integer :value,                    null: false
      t.references :user,                  foreign_key: true
      t.text :description,                 null: false
      t.integer :delivery_id,              null: false
      t.integer :place_id,                 null: false
      t.integer :how_long_id,              null: false
      t.integer :category_id,              null: false
      t.integer :status_id,                null: false

      t.timestamps
    end
  end
end

