#u Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/', to: 'profile#show', as: :profile
get '/auth', to: 'sessions#new', as: :auth
post '/auth/callback', to: 'sessions#create'
