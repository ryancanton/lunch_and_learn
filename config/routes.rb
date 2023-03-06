Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :learning_resources, only: :index
      resources :countries, only: :do
    end
  end
end
