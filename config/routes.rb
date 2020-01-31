Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :homes do
    get '/current_temps' => 'homes#latest_temps_by_home'
    resources :rooms do
      get '/current_temp' => 'rooms#latest_temp_by_room'
      resource :temperature
    end
  end
end
