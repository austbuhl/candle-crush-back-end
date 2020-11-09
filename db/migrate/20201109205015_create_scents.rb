class CreateScents < ActiveRecord::Migration[6.0]
  def change
    create_table :scents do |t|
      t.string :scent
      t.integer :candle_id
      
    end
  end
end
