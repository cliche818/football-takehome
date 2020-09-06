Rails.application.routes.draw do
  root 'player_rushing_stats#index'

  resource :player_rushing_stats, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
