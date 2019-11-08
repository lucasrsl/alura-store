class CreateProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :produtos do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
