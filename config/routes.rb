Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'pingpong' => 'games#pingpong'
  get 'blackjack' => 'games#blackjack'
end
