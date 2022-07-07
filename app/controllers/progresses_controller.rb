class ProgressesController < ApplicationController
  def new
    @progress = Progress.new
    current_game = Game.find(params[:game_id])
    @question = Question.next_question(current_game)
  end

  def create
    current_game = Game.find(params[:game_id])

    # 回答した内容を保存
    progress = current_game.progresses.new(create_params)
    progress.assign_sequence
    progress.save!

    redirect_to new_game_progress_path(current_game)
  end

  private

    def create_params
      params.require(:progress).permit(%i[question_id answer])
    end
end
