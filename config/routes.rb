Dayakisthat::Application.routes.draw do
  post "service/upvote"
  post "service/downvote"
  root "messages#index"
  get "messages" => 'messages#index', as: :messages
  get "my_tops" => 'messages#my_tops', as: :my_tops
  get 'yak/:id', to: 'messages#show', as: :show_yak
  get "set_lat_long" => 'messages#set_client_lat_long', as: :set_lat_long
  
   
end
