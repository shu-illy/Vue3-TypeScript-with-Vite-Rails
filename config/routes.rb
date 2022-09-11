Rails.application.routes.draw do
  root 'tops#index'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :tweets, only: [:index, :create, :destroy]
    end
  end
end
