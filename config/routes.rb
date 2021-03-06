Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers, controllers: {
    sessions:      'public/customers/sessions',
    registrations: 'public/customers/registrations'
  }

  devise_scope :customer do
    post 'customer/guest_sign_in', to: 'public/customers/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :customers, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      collection do
        get :favorites
      end
    end
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    get 'recommend' => 'posts#recommend'
    get 'vacant_house' => 'posts#vacant_house'
    get 'chat/:id' => 'chats#show', as: 'chat'
    resources :chats, only: [:create]
    get 'contact' => 'contacts#new'
    post 'contact/confirm' => 'contacts#confirm'
    post 'contact/complete' => 'contacts#complete'
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, except: [:index, :new]
    get 'recommend' => 'posts#recommend'
    get 'vacant_house' => 'posts#vacant_house'
  end
end
