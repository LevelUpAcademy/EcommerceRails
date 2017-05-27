class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :briefing
      t.text :description
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
