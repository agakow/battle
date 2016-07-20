require 'sinatra/base'
require_relative 'lib/player'

class Battle < Sinatra::Base

  enable :sessions


  get '/' do
    erb :index
  end

  post '/names' do
    $player_1_name = params[:player_1_name]
    $player_2_name = params[:player_2_name]
    redirect '/play'
  end

  get '/play' do
    Player.new($player_1_name)
    Player.new($player_2_name)
    @hit_message = session[:attack]
    erb :play
  end

  get '/attack' do
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
