Rails.application.routes.draw do
  root 'users#new'
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  put 'users/:id' => 'users#update'

  post 'sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'

  get 'events' => 'events#index'
  post 'events' => 'events#create'
  delete 'events/:id' => 'events#destroy'
  get 'events/:id' => 'events#show'
  get 'events/:id/edit' => 'events#edit'
  put 'events/:id' => 'events#update'

  post 'attendees/:id' => 'attendees#create'
  delete 'attendees/:id' => 'attendees#destroy'

  post 'events/comments/:id' => 'comments#create'

end
