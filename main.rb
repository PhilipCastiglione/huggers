require 'sinatra'
require 'sinatra/contrib/all'
require 'pg' #is this necessary with active_record?
require 'pry'
require 'httparty' #only necessary for external API access
require 'bcrypt'

require_relative 'config'
require_relative 'user'
require_relative 'profile_photo'

enable :sessions

helpers do
  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end

# db
after do
  ActiveRecord::Base.connection.close
end

# huggers
get '/' do
  if current_user.nil?
    erb :index
  else
    redirect to "/users/#{current_user.id}"
  end
end

get '/session/new' do
  @retained_content = {}
  erb :login
end

post '/session' do
  @current_user = User.find_by(email: params[:email])

  if @current_user && @current_user.authenticate(params[:password])
    session[:user_id] = @current_user.id
    redirect to "/users/#{@current_user.id}"
  else
    @retained_content = params
    erb :login
  end
end

get '/users/new' do
  @retained_content = {}
  erb :users_new
end

post '/users' do
  user = User.new()
  user.password = params[:password] # WHY DOES THIS LINE HAVE TO BE SEPERATE TO WORK WTF
  ['email','first_name','middle_name','last_name','dob','gender','relationship','partner_user_id','nationality','location'].each do |attribute|
    user[attribute] = params[attribute.to_sym]
  end
  
  if user.save
    session[:user_id] = user.id
    redirect to "/users/#{user.id}"
  else
    @retained_content = params
    erb :users_new
  end
end

get '/huggers/about' do
  erb :about
end

# MM/Relationship
get '/users/:user_id' do
  
  @user = User.find_by(id: params[:user_id])
  if @user.nil? 
    @error = "User not found!"
    erb :error
  elsif current_user.id.to_s == params[:user_id]
    erb :private_profile
  else
    erb :public_profile
  end

end

get '/users/:user_id/community' do
end

get '/users/:user_id/games' do
end

get '/users/:user_id/settings' do
end

# MM
get '/users/:user_id/search' do
end

get '/users/:user_id/list' do

  # search criteria

  # for external hosting of API
  # url = '/api/users'
  # @users_data = HTTParty.get(URI.escape(url))
  
  erb :list
end

get '/users/:user_id/flirts' do
end

# Relationship
get '/users/:user_id/us' do
end

# APIs
get '/api/users' do
  content_type :json
  User.all.to_json
end

get '/api/profile_photos' do
  content_type :json
  Profile_photo.all.to_json
end
