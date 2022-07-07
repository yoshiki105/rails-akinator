class GamesController < ApplicationController
  def new; end

  def create
    game = Game.create!(status: 'in_progress')
    redirect_to new_game_progress_path(game)
  end

  def give_up; end

  def challenge
    current_game = Game.find(params[:id])
    extract_comics = ExtractionAlgorithm.new(current_game).compute
    @comic = extract_comics.first
  end
end
