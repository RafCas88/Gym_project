require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/members_controller')
# require_relative('controllers/activities_controller')
# require_relative('controllers/registrations_controller')

get '/' do
  erb( :index )
end
