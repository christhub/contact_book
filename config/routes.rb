Rails.application.routes.draw do
  resources :messages, :only => [:index, :show, :create, :new]
  resources :contacts
  root 'messages#index'
end
