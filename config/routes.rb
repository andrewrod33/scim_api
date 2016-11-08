Rails.application.routes.draw do
  resources :users, :only => [:create, :edit, :index, :show], defaults: {format: :json}
end
