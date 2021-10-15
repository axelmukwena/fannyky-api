Rails.application.routes.draw do
  scope :api do
    devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
               }

    get '/painters/', to: 'painters#index', as: 'painters'

    resources :painters, path: '' do
      resources :paintings
      resources :exhibitions
    end

  end
end