require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    @game = Game.create(params[:player_1_name], params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    @game.attack
    redirect '/loser' if @game.loser?
    @game.switch_turn
    redirect '/play'
  end

  get '/loser' do
    erb :loser
  end

  run! if app_file == $0
end
