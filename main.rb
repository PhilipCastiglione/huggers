require 'sinatra'
require 'sinatra/contrib/all'
require 'pg' #is this necessary with active_record?
require 'pry'
require 'bcrypt'
require 'json' #is this necessary?

require 'httparty' #only necessary for external API access
  # example for external hosting of API
  # url = '/api/users'
  # @users_data = HTTParty.get(URI.escape(url))

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

def validate_login
  if !logged_in?
    redirect to '/'
  end
end

def validate_current_user(user_id)
  if user_id != current_user.id.to_s
    redirect to '/'
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

get '/session/logout' do
  session[:user_id] = nil
  redirect to '/'
end

get '/users/new' do
  @retained_content = {}
  erb :new_user
end

post '/users' do
  user = User.new()
  user.password = params[:password]
  ['email','first_name','last_name','dob','gender','relationship','partner_user_id','location','description'].each do |attribute|
    user[attribute] = params[attribute.to_sym]
  end

  if user.save
    session[:user_id] = user.id
    redirect to "/users/#{user.id}"
  else
    @retained_content = params
    erb :new_user
  end
end

post '/users/:user_id' do
  user = User.find_by(id: params[:user_id])
  user.email = params[:email]
  user.password = params[:password]

  if user.save
    redirect to "/users/#{user.id}"
  else
    erb :settings
  end

end

get '/huggers/about' do
  erb :about
end

# MM/Relationship
get '/users/:user_id/profile' do
  redirect to "/users/#{params[:user_id]}"
end

get '/users/:user_id' do
  
  @user = User.find_by(id: params[:user_id])
  
  if  session[:user_id].nil? #no user entered

    @error = "Log in or sign up!"
    erb :error

  elsif @user.nil? #user not present

    @error = "User not found!"
    erb :error

  else

    @partner = User.find_by(id: @user.partner_user_id)

    if current_user.nil? #no one logged in
      erb :public_profile
    elsif current_user.id.to_s == params[:user_id] #logged in user = profile user
      erb :private_profile
    else
      erb :public_profile #logged in user != profile user
    end

  end
end

get '/users/:user_id/public' do

  @user = User.find_by(id: params[:user_id])
  
  if @user.nil? #user not present

    @error = "User not found!"
    erb :error

  else

    @partner = User.find_by(id: @user.partner_user_id)
    erb :public_profile

  end
end

get '/users/:user_id/photos' do
  validate_login

  @user = User.find_by(id: params[:user_id])
  erb :photos
end

get '/users/:user_id/community' do
  validate_login
  validate_current_user params[:user_id]

  @user = User.find_by(id: params[:user_id])
  erb :community
end

get '/users/:user_id/games' do
  validate_login
  validate_current_user params[:user_id]

  @user = User.find_by(id: params[:user_id])
  erb :games
end

get '/users/:user_id/settings' do
  validate_login
  validate_current_user params[:user_id]

  @user = User.find_by(id: params[:user_id])
  erb :settings
end

# MM
get '/users/:user_id/search' do
  validate_login
  validate_current_user params[:user_id]

  @user = User.find_by(id: params[:user_id])
  erb :search
end

get '/users/:user_id/list' do
  validate_login
  validate_current_user params[:user_id]
  if !params[:search] 
    redirect to "/users/#{session[:user_id]}/search"
  else
    @criteria = {
      gender: params[:gender],
      min_age: params[:min_age],
      max_age: params[:max_age],
      location: params[:location]
    }
    erb :list
  end
end

get '/users/:user_id/flirts' do
  validate_login
  validate_current_user params[:user_id]

  @user = User.find_by(id: params[:user_id])
  erb :flirts
end

# Relationship
get '/users/:user_id/us' do
  validate_login
  validate_current_user params[:user_id]

  @user = User.find_by(id: params[:user_id])
  @partner = User.find_by(id: @user.partner_user_id)

  if @partner.nil?
    redirect '/'
  else
    erb :us
  end
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
