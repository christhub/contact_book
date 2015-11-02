Rails.application.routes.draw do
  resources :messages, :only => [:index, :show, :create, :new]

  root 'messages#index'
end
