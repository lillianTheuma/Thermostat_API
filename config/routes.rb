Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :homes do
    get '/current_temps' => 'homes#latest_temps_by_home'
    resources :rooms do
      get '/ac_on' => 'rooms#ac_on?'
      get '/heater_on' => 'rooms#heater_on?'
      patch '/update_setting' => 'rooms#configure_temp_setting'
      get '/current_temp' => 'rooms#latest_temp_by_room'
      get '/temperatures' => 'rooms#temperatures'
      get '/temperatures_today' => 'rooms#temperatures_today'
    end
  end
end
