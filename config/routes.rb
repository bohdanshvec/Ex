Rails.application.routes.draw do

  resources :products do
    resources :terms, expect: %i[index show]
  end
  
  root "products#index"
end
