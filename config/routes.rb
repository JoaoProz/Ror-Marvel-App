Rails.application.routes.draw do
  get "", to: redirect('/comics/index')
  get 'comics/index'
  post "add_vote", to: 'upvotes#add_vote'
  delete "remove_vote", to: 'upvotes#remove_vote'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
