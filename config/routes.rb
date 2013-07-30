EncryptionExample::Application.routes.draw do
  resources :accounts do
    member do 
      get :sync
    end
  end
  root to: "accounts#index"
end
