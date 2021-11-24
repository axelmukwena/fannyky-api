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

    resources :painters, path: '' do
      resources :paintings do
        post 'images', to: 'paintings#create_images'
      end
      resources :exhibitions
      resources :talks
      resources :awards
      resources :publications
    end

  end
end
