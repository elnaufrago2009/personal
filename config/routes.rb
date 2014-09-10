Rails.application.routes.draw do  

  root 'abouts#index'
  resources :abouts do
    collection {
      get :home
    }
  end

  resources :registros do
    collection {
      get :usuarios
      get :option_entrada
      get :option_salida
      get :todos
      post :todos
      get :message
      post :add_message
      get :superadmin_message
      post :add_superadmin_message
      get :option_salida_todos
      get :option_entrada_todos
      get :user_day
      get :option_entrada_user
      get :option_salida_user
      get :user_day_registro
    }
  end

  resources :user_turnos do
    collection {
      get :asignar_turnos
      get :agregar
      get :desasignar
    }
  end

  resources :turnos
  resources :areas
  resources :center_works
  resources :deparments

  resources :assign_roles do
    collection {
      get :asignar
      get :quitar
    }
  end

  resources :inicios do 
    collection {
      get :registrar_turno
      get :registrar_paridad
      get :message
      post :envio_message
      get :horario_area
    }
  end

  resources :admins do
    collection {
      get :asignar
      get :add_admin
      get :agregado    
      get :quitar_user
    }
  end

  resources :posts
  devise_for :users


  #root :to => 'abouts#index', :constraints => lambda { |request| user.role == 'admin' }


end
