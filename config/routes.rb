Rails.application.routes.draw do
  resources :player_rushing_stats, only: [:index]
  resources :team_rushing_stats, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
