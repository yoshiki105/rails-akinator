class ExtractionAlgorithm
  attr_reader :game, :query

  def initialize(game)
    Rails.logger.debug('ExtractionAlgorithm initialized.')
    @game = game
    @query = Comic.all
  end

  def compute
    progresses = @game.progresses
    progresses.each do |progress|
      question = progress.question

      # 絞り込み処理

      Rails.logger.debug("On the way query is #{@query.to_sql}")
      Rails.logger.debug("On the way comics are #{@query.pluck(:title).to_a}")
    end
    @query
  end
end
