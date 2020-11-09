class RemoveScentFromCandles < ActiveRecord::Migration[6.0]
  def change
    remove_column :candles, :scent, :string
  end
end
