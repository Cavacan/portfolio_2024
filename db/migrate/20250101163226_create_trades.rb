class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.string :platform
      t.datetime :open_time
      t.string :type
      t.float :size
      t.string :item
      t.float :open_price
      t.datetime :close_time
      t.float :close_price
      t.float :commission
      t.float :trade_pl

      t.timestamps
    end
  end
end
