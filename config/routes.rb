Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
    resources :podcasts, only: [:show, :new, :edit]
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
