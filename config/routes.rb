Rails.application.routes.draw do

  resources :products do
    resources :terms, expect: %i[index show] do
      resources :positions, expect: %i[index show]
    end
  end
  
  root "products#index"
end
