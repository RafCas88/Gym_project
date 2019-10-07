require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/registration.rb' )
require_relative( '../models/activity.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/registrations' do
  @registrations = Registration.all
  erb ( :"registrations/index" )
end

get '/registrations/new' do
  @activities = Activity.all
  @members = Member.all
  erb(:"registrations/new")
end

post '/registrations' do
  registration = Registration.new(params)
  registration.save
  redirect to("/registrations")
end

post '/registrations' do
  registration= Registration.new(params)
  registration.save
  redirect to("/registrations")
end

post '/registrations/:id/delete' do
  registration = Registration.find(params['id'])
  registration.delete
  redirect to("/registrations")
end
