Rails.application.routes.draw do
  scope '/blog' do
    resources :posts do
      resources :comments
    end
  end
  devise_for :users
  root :to => 'skills#index'
  resources :skills do
    resources :projects
  end
  resources :projects
  get 'blog', to: 'posts#index', as: :blog
  get '/references', to: 'skills#show_refs', as: 'references'
  get '/hide_refs', to: 'skills#hide_refs', as: 'hide_refs'
end
