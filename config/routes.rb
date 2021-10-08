Rails.application.routes.draw do
  scope :api do
    resources :painters do
      resources :paintings
    end
    devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'signin',
                 sign_out: 'signout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
               }
  end
end
