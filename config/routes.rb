Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords],  controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    get '/' => "homes#top"
  end

  namespace :public do
    get '/' => "homes#top"
    get '/items' => "items#index"
  end

  get '/customers/my_page' => "public/customers#show"
  get '/customers/my_page/edit' => "public/customers#edit"
  get '/customers/orders' => "public/orders#index"
  get '/customers/cart_items' => "public/cart_items#index"

  resources :admin
  resources :public


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
