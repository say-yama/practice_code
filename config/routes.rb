Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :sinsui, only: [:index]
  get 'pingpong' => 'games#pingpong'
  get 'blackjack' => 'games#blackjack'
end
