Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'toppages/europe', to: 'toppages#europe'
  get 'toppages/asia', to: 'toppages#asia'
  get 'toppages/america', to: 'toppages#america'
end
