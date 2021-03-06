Rails.application.routes.draw do

  post '/token/new', to: 'sessions#create'
  resources :users, only: [:index, :show, :update, :create,:destroy] do
    resources :teams_relationships, only: [:show, :index, :update, :destroy], path: 'memberships'
    #* requests has two routes, because I am using params from the routing,
    #* and I want routes for users and teams to have different urls
    resources :team_requests, path: 'requests' do
      patch :accept
      patch :reject
    end
  end

  resources :teams, only: [:show, :index, :create, :update, :destroy] do
    resources :projects, only: [:show, :index, :create, :update, :destroy] do
      resources :tasks, only: [:show, :index, :create, :update, :destroy]
    end

    resources :teams_relationships, only: [:show, :index, :update, :destroy], path: 'members'
    #* requests has two routes, because I am using params from the routing,
    #* and I want routes for users and teams to have different urls
    resources :team_requests, path: 'requests' do
      patch :accept
      patch :reject
    end
  end
end
