Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :todos do
    resources :items
  end  
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'
end


