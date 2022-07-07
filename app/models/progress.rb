class Progress < ApplicationRecord
  belongs_to :game
  belongs_to :question

  def assign_sequence
    next_sequence = 1
    return unless game.present?

    all_progress = game.progresses
    if all_progress.count.positive?
      next_sequence = all_progress.maximum(:sequence) + 1
    end
    self.sequence = next_sequence
  end
end
