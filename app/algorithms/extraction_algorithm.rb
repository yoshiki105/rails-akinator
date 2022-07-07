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
      case question.algorithm
      when 'serialization_end'
        serializtion_end?(progress)
      else
        raise Exception("invalid algorithm. --> #{question.algorithm}")
      end

      Rails.logger.debug("On the way query is #{@query.to_sql}")
      Rails.logger.debug("On the way comics are #{@query.pluck(:title).to_a}")
    end
    @query
  end

  private

    def serializtion_end?(progress)
      if progress.positive_answer?
        @query = @query.where.not(serialization_end_year: nil)
      end

      if progress.negative_answer?
        @query = @query.where(serialization_end_year: nil)
      end
    end
end
