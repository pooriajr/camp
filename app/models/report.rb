class Report < ApplicationRecord
  belongs_to :camper
  validates :body, presence: true

  scope :most_recent, -> { order(created_at: :desc) }
end
