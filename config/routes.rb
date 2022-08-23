Rails.application.routes.draw do
  get '/' => 'homes#top'
  get 'about' => 'homes#about'
  resources :games, only: [:index]
end
