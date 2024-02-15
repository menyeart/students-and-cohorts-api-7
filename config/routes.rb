Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students, only: [:index]
      resources :cohorts, only: [:show]
    end
  end
end
