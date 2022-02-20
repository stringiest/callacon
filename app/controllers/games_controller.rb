class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(user_id: session[:user_id],
                    title: params[:game][:title],
                    game_system: params[:game][:game_system],
                    description: params[:game][:description],
                    min_players: params[:game][:min_players],
                    max_players: params[:game][:max_players],
                    pref_when: params[:game][:pref_when],
                    desired_players: params[:game][:desired_players],
                    campaign: params[:game][:campaign],
                    game_duration_hours: params[:game][:game_duration_hours],)
    if @game.save
      redirect_to games_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to games_url
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy
    redirect_to games_url
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :game_system, :description, :min_players,
                                :max_players, :pref_when, :desired_players,
                                :campaign, :game_duration_hours)
  end
end
