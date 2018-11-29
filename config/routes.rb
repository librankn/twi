Rails.application.routes.draw do
  # root to:'home#top'
  resources :contributions do
    collection do
      post :confirm
      # post :top
    end
  end

end