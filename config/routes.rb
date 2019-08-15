Rails.application.routes.draw do
  # get 'doses/index'
  # get 'doses/new'
  # get 'doses/show'
  # get 'doses/edit'
  # get 'cocktails/index'
  # get 'cocktails/new'
  # get 'cocktails/show'
  # get 'cocktails/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses
  end

  delete 'doses/:id' => 'doses#destroy'
  root to: 'cocktails#index'
end
