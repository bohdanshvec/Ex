Rails.application.routes.draw do
  devise_for :users

  resources :products do
    resources :terms, expect: %i[index show] do
      resources :positions, expect: %i[index show]
    end
  end
  
  root "pages#index"
end
