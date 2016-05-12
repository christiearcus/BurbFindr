Rails.application.routes.draw do

get '/' => 'suburbs#index'
get '/results' => 'suburbs#results'
get '/results/data' => 'suburbs#data'
get '/api/suburbs/' => 'api/suburbs#get_all_suburbs'

end
