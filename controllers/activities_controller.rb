require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/activity.rb' )
also_reload( '../models/*' )

get '/activities' do
  @activities = Activity.all()
  erb ( :"activities/index" )
end

get '/activities/:id' do
  @activity = Activity.find(params['id'])
  erb(:"activities/show")
end
