Bbs::Engine.routes.draw do
  resources :profiles, only: %i(edit update)

  resources :categories do
    resources :topics, shallow: true do
      resources :comments, shallow: true
    end
  end
end
