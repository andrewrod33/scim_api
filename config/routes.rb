Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      resources :users, :only => [:create, :edit, :index, :show], defaults: {format: :json}
    end
  end
end
