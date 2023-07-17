Rails.application.routes.draw do
  resources :points
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post "/points/single", to: "points#show"
  post "/georegions/single", to: "georegions#show"
  get "/georegions", to: "georegions#index"
  get "/crossbills", to: "crossbills#index"
  # Defines the root path route ("/")
end
