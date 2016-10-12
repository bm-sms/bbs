Bbs::Engine.routes.draw do
  resource :profile, only: %i(edit create update)

  resources :categories do
    resources :topics, shallow: true do
      resources :comments, shallow: true
    end
  end
end
