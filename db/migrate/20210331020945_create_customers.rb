class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :buy,                  foreign_key: true
      t.string :postal_code,              null: false
      t.integer :place_id,                null: false
      t.string :municipalities,           null: false
      t.string :address,                  null: false
      t.string :tel_number,               null: false
      t.string :build_name
      t.timestamps
    end
  end
end

