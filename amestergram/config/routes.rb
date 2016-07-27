Rails.application.routes.draw do
  get 'user/new'

  root 'static_pages#home'
  get 'static_pages#about'
  get 'static_pages#help'
  get  'static_pages#contact'
  get 'signup'  => 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
