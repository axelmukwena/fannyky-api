Rails.application.routes.draw do
  scope :api do
    resources :categories
    devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 sign_up: 'signup'
               },
               controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
               }

    get '/authorize', to: 'application#authorize'
    get '/painters', to: 'painters#index'

    # I'm using posts to create/remove images because
    # delete does not accept payloads and Authorization token
    resources :painters, path: '' do
      post 'images', to: 'painters#create_images'
      post 'image', to: 'painters#delete_image'
      resources :paintings do
        post 'images', to: 'paintings#create_images'
        post 'image', to: 'paintings#delete_image'
      end
      resources :exhibitions do
        post 'images', to: 'exhibitions#create_images'
        post 'image', to: 'exhibitions#delete_image'
      end
      resources :talks do
        post 'images', to: 'talks#create_images'
        post 'image', to: 'talks#delete_image'
      end
      resources :awards do
        post 'images', to: 'awards#create_images'
        post 'image', to: 'awards#delete_image'
      end
      resources :publications do
        post 'images', to: 'publications#create_images'
        post 'image', to: 'publications#delete_image'
      end
    end

  end
end
