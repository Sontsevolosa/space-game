require 'sinatra'
# require 'sinatra/jsonp'
require './lib/gothonweb/map.rb'
require 'erb'
require 'rubygems'
require "digest/sha1"
require 'bundler/setup'

Bundler.require

DB = Sequel.connect('sqlite://db.sqlite')

class User < Sequel::Model
end

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions
set :session_secret, 'BADSECRET'


def set_current_user(user)
    if user
        session[:user_id] = user.id
    else
        session[:user_id] = nil
    end
end

def current_user
    if session[:user_id]
        User.where(id: session[:user_id]).first
    end
end

get '/' do
    if current_user
        redirect to('/choice')
    else
        erb :login
    end
end

get '/login' do
    erb :login
end

post '/login' do
    @errors = []
    
    if params[:username].to_s.empty?
        @errors << "No username!"
    end
    
    if params[:password].to_s.empty?
        @errors << "No password!"
    end
    
    user = User.where(username: params[:username]).first
    
    if user.nil?
        @errors << "No user with username #{params[:username].inspect}!"
    elsif
        user.password != params[:password] || user.username != params[:username]
        @errors << "Wrong username or password!"
    end
    
    if @errors.any?
        erb :login
    else
        set_current_user(user)

        redirect to('/choice')
    end
end

get '/logout' do
    set_current_user(nil)
    redirect to('/')
end

get '/register' do
    erb :register
end

post '/register' do
    @errors = []
    
    if params[:username].to_s.empty?
        @errors << "No username!"
    end
    
    if params[:password].to_s.empty?
        @errors << "No password!"
    end
    
    if @errors.any?
        erb :register
    else
        user = User.new
        user.username = params[:username]
        user.password = params[:password]
        user.save
        
        set_current_user(user)
        
        redirect to('/')
    end
end

get '/choice' do
    erb :choice
end

get '/long' do
    session[:room] = 'START'
    redirect to('/game')
    erb :layout
end

get '/short' do
    session[:room] = 'BEGINNING'
    redirect to('/game')
    erb :layout
end

get '/game' do
    room = Map::load_room(session)
    
    if room
        erb :show_room, :locals => {:room => room}
    else
        erb :you_died
    end
end


post '/game' do
    room = Map::load_room(session)
    action = params[:action]
    
    if room
        next_room = room.go(action) || room.go("*")
        
        if next_room
            Map::save_room(session, next_room)
        end
        
        redirect to('/game')
    else
        erb :you_died
    end
end



__END__

@@ hello_user
<a href="/logout">Log Out</a>
<br/>

Hello, <%= current_user.username %>
