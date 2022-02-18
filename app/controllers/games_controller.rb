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
    # amend fields for game - check questionnaire
    @game = Game.new(user_id: session[:user_id], arrival: params[:booking][:arrival], departure: params[:booking][:departure])
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
    # check game params & update
    params.require(:booking).permit(:arrival, :departure)
  end
end
