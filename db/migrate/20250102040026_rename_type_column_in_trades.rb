class RenameTypeColumnInTrades < ActiveRecord::Migration[7.1]
  def change
    rename_column :trades, :type, :trade_type
    rename_column :trades, :size, :trade_size
    rename_column :trades, :item, :trade_item
  end
end
