class CreateCandles < ActiveRecord::Migration[6.0]
  def change
    create_table :candles do |t|
      t.string :name
      t.float :price
      t.string :image
      t.string :description
      t.string :scent

      t.timestamps
    end
  end
end
