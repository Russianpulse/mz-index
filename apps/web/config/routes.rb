# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/', to: 'home#index'
get '/12bad61b9a47.html', to: ->(env) { [200, {}, ['02e342a22fc7']] }
