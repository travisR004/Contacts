Contacts::Application.routes.draw do
  resources :users, :only => [:create, :destroy, :index, :show, :update] do
    resources :contacts, :only => [:index] do
      collection do
        get 'favorites'
      end
    end
    resources :comments, :only => [:index]
    resources :contact_groups, :only => [:index]

  end

  resources :contacts, :only => [:create, :destroy, :show, :update]

  resources :contact_shares, :only => [:create, :destroy]

  resource :contact_groups, :only => [:create, :destroy, :show, :update]
  resource :comments, :only => [:create, :destroy, :show, :update]

end
