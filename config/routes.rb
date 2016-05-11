Rails.application.routes.draw do

get '/' => 'suburbs#index'
get '/results' => 'suburbs#results'
#get '/api/suburbs' => 'api/suburbs#get_suburbs'
get '/api/suburbs/:min_price/:max_price' => 'api/suburbs#suburb_selection'

end
