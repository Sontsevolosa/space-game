require './bin/app.rb'
require 'test/unit'
require 'rack/test'
require 'bundler/setup'

Bundler.require

class MyAppTest < Test::Unit::TestCase
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end
    
    def test_my_default
        get '/'
        assert last_response.ok?
        assert last_response.body.include?('Welcome to the world of space!')
        
    end
    
    def test_game
        get '/game'
        assert last_response.ok?
        assert last_response.body.include?('Looks like you bit the dust.')
    end
end
