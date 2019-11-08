Rails.application.routes.draw do
  resources :restos do

  collection do
    get 'random', to: 'restos#random', as: 'random' 
    get 'popular', to: 'restos#most_popular', as: 'popular' 
    get 'starred', to: 'restos#starred_restos', as: 'starred'
  end
end

  devise_for :users

  post 'star', to: 'stars#star', via: :resto

  match 'unstar', to: 'stars#unstar', via: :delete

  root 'restos#index'

end
