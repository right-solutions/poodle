Rails.application.routes.draw do
  mount Poodle::Engine => "/poodle"

  resources :images, controller: "profile_pictures" do
    member do
      put :crop
    end
  end

  namespace :custom do
    resources :images do
      member do
        put :crop
      end
    end
  end

end
