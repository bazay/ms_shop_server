Rails.application.routes.draw do
  root to: 'shop#index'

  match 'shop', to: 'shop#index', via: :get, as: :shop
end
