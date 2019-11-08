class CreateRestos < ActiveRecord::Migration
  def change
    create_table :restos do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.integer :cuisine_id

      t.timestamps null: false
    end
  end
end
