Rails.application.routes.draw do
  scope :api do
    resources :paintings
    resources :painters
    devise_for :users
  end
end
