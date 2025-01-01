Rails.application.routes.draw do
  root "home#index"

  get 'finance' => "finance#index"
  post 'finance/upload' => 'finance#upload'
  get 'exness' => 'exness#index'
end
