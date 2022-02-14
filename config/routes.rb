Rails.application.routes.draw do
  namespace :api , defaults:{ format: :json} do
    namespace :v1 do
      resources :users, onely: %i[show create update destroy]  
    end
  end
end
