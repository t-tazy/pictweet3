Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :tweets, only: %i[index new create destroy]
end
