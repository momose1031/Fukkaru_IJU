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
    resources :customers, only: [:index, :show, :edit, :update]
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
