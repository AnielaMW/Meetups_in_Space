require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"
  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."
  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order('name')
  erb :'meetups/index'
end

get '/meetups/create_new' do
  if current_user
    @new_meetup = Meetup.new({name: params[:name], location: params[:location], description: params[:description], user_id: current_user.id})
    erb :'meetups/create'
  else
    flash[:notice] = "You need to sign-in to create a new Meetup."
    redirect '/'
  end
end

post '/meetups/create_new' do
  @new_meetup = Meetup.new(name: params[:name], location: params[:location], description: params[:description], user_id: current_user.id.to_i)
  @errors = @new_meetup.errors.full_messages
  if @new_meetup.save
    redirect '/meetups/' + Meetup.where("name = ? AND description = ?", @new_meetup.name, @new_meetup.description).first.id.to_s
  else
    @errors = @new_meetup.errors.full_messages
    erb :'meetups/create'
  end
end

post '/meetups/join' do
  if current_user
    user_id = current_user.id
    meetup_id = params[:joinMeetup]
    attendee = Attendee.new(user_id: user_id, meetup_id: meetup_id)
    attendee.save
    flash[:notice] = "You have joined the Meetup."
    redirect '/meetups/' + meetup_id
  else
    flash[:notice] = "You need to sign-in to join this Meetup."
    redirect '/'
  end
end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])
  if current_user
    @current_user_attending = Attendee.where("meetup_id = ? AND user_id = ?", params[:id], current_user.id).first
  else
    @current_user_attending = nil
  end
  @attendees = []
  Attendee.where("meetup_id = ?", params[:id]).each do |user|
    add_user = User.find(user.user_id)
    @attendees << add_user
  end
  erb :'meetups/show'
end
