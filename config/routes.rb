Rails.application.routes.draw do
  get 'comics/index'
  get 'comics/by_character'
  post "add_vote", to: 'upvotes#add_vote'
  delete "remove_vote", to: 'upvotes#remove_vote'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
