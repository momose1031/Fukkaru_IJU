Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers, controllers: {
    sessions:      'public/customers/sessions',
    registrations: 'public/customers/registrations'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :customers, only: [:index, :show, :edit, :update] do
      collection do
        get :favorites
      end
    end
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'
    resources :posts, except: [:index] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    get 'recommend' => 'posts#recommend'
    get 'vacant_house' => 'posts#vacant_house'
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, except: [:index, :new]
    get 'recommend' => 'posts#recommend'
    get 'vacant_house' => 'posts#vacant_house'
  end
end
