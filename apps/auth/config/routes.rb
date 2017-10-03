#u Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/api/token', to: 'api#token'
get '/api/auth.js', to: 'api#js'
get '/logout', to: 'sessions#destroy'
get '/', to: 'profile#show', as: :profile
get '/json', to: 'profile#show', as: :profile
get '/auth', to: 'sessions#new', as: :auth
post '/auth/callback', to: 'sessions#create'
