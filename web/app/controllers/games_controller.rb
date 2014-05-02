class GamesController < ApplicationController

  def new
  end

  def create
    # players = params[:players].reject {|name| name.length == 0}
    result = RabbitDice::CreateGame.run(params)

    if result.success?
      flash[:success] = "You have successfully create a new game"
      # render json: {success: true, game: result.game}
      redirect_to "/games/#{result.game.id}"
    else
      render json: {success: false}
    end
  end

  def show
    @game = RabbitDice.db.get_game(params[:id])
  end

  def update

  end


end
