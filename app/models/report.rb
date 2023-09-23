class Report < ApplicationRecord
  belongs_to :camper
  validates :body, presence: true

  scope :most_recent, -> { order(created_at: :desc) }
  scope :in_last_month, -> { where('created_at > ?', 31.days.ago) }

  def deletable?
    created_at > 5.minutes.ago
  end

  def minutes_left_to_delete
    (((created_at + 5.minutes) - Time.now) / 60).round
  end

end
