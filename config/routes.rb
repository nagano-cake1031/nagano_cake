Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'orders/complete' => "public/orders#complete"
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords],  controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    get 'items/new' => "items#new"
    post 'items' => "items#create"
    get 'items' => "items#index"
    get 'items/:id' => "items#show", as: 'item'
    get 'items/:id/edit' => "items#edit", as: 'items_edit'
    patch 'items/:id' => "items#update"
    resources :orders, only:[:show]
  end

 scope module: :public do
    resources :items, only: [:index, :show]
    root to: 'homes#top'
    resources :cart_items, only: [:index, :update, :create, :destroy, :update]
    resources :orders, only: [:index, :new, :show]
    post '/orders/check' => "orders#check"
    post '/orders' => "orders#create", as: 'orders_create'
    delete '/cart_items/destroy_all' => "cart_items#destroy_all"
    get '/customers/my_page' => "customers#show"
    get '/customers/my_page/edit' => "customers#edit"
    patch '/customers/my_page' => "customers#update", as: 'my_page_edit'
    get '/customers/orders' => "orders#index"
    get '/customers/cart_items' => "cart_items#index"
    post '/cart_items/:id' => "cart_items#show"
    get '/customers/withdraw_confirmation' => "customers#withdraw_confirmation", as: 'customers_withdraw_confirmation'
    patch '/customers/withdraw' => "customers#withdraw"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
