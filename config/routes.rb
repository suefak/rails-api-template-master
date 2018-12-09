# frozen_string_literal: true

Rails.application.routes.draw do
  resources :checklist_items, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'

  # default routes
  # post '/checklist_items' => 'checklist_items#create'
  # get '/checklist_items' => 'checklist_items#index'
  # get '/checklist_items/:id' => 'checklist_items#show'
  patch '/checklist_items/:id' => 'checklist_items#update'
  # delete '/checklist_items/:id' => 'checklist_items#delete'

end
