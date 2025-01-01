class FinanceController < ApplicationController
  require 'csv'
  def index
    @platform = [
      ['Exness', 'exness'],
      ['Other', 'other']
    ]
  end

  def upload
    if params[:csv_file].present?
      csv.foreach(params[:csv_file].path, headers: true) do |row|
        Trade.create!(
          platform: params[:platform],
          open_time: row['Open Time'],
          type: row['Type'],
          size: row['Size'],
          item: row['Item'],
          open_price: row['Open Price'],
          close_time: row['Close Time'],
          close_price: row['Close Price'],
          commission: row['Commission'],
          trade_pl: row['Trade P/L']
        )
      end
      redirect_to exness_path, notice: 'Complite CSV.'
    else
      redirect_to finance_path, alert: 'Select CSV.'
    end
  end
end
