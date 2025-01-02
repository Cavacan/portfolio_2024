class FinanceController < ApplicationController
  require 'CSV'
  def index
    @platform = [
      ['Exness', 'exness'],
      ['Other', 'other']
    ]
  end

  def upload
    if params[:csv_file].present?
      CSV.foreach(params[:csv_file].path, headers: true) do |row|
        open_price = row['Open Price'].to_f
        close_price = row['Close Price'].to_f
        commission = row['Commission'].to_f

        if row['Type'].downcase == 'buy'
          tpl = close_price - open_price + commission
        else
          tpl = open_price - close_price + commission
        end

        Trade.create!(
          platform: params[:platform],
          open_time: row['Open Time'],
          trade_type: row['Type'],
          trade_size: row['Size'],
          trade_item: row['Item'],
          open_price: open_price,
          close_time: row['Close Time'],
          close_price: close_price,
          commission: commission,
          trade_pl: tpl
        )
      end
      redirect_to exness_path, notice: 'Complite CSV.'
    else
      redirect_to finance_path, alert: 'Select CSV.'
    end
  end
end
