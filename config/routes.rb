Rails.application.routes.draw do
  scope :api do
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
      resources :paintings
      resources :exhibitions
    end

  end
end
