class AddQtyToCandles < ActiveRecord::Migration[6.0]
  def change
    add_column :candles, :quantity, :integer
    add_column :candles, :starting_inv, :integer
  end
end
