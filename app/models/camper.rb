# == Schema Information
#
# Table name: campers
#
#  id                  :integer          not null, primary key
#  aka                 :string
#  name                :string
#  project             :string
#  project_description :string
#  project_status      :string
#  project_url         :string
#  stats               :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Camper < ApplicationRecord
  serialize :stats, Array
  has_many :reports, dependent: :destroy
  validates :project_url, format: { with: /\Ahttps?:\/\/.*\z/, message: "must start with http:// or https://" }, allow_blank: true

  # order by who has the most reports, tiebreak on who has the most recent report
  scope :most_reports, -> { left_joins(:reports).group(:id).order('COUNT(reports.id) DESC') }
  scope :most_recent_report, -> { left_joins(:reports).group(:id).order('MAX(reports.created_at) DESC') }
  scope :with_reports_in_last_month, -> { joins(:reports).where('reports.created_at > ?', 31.days.ago) }
  scope :without_reports_in_last_month, -> { where.not(id: with_reports_in_last_month) }
  scope :complete, -> { where(project_status: 'complete') }
  scope :in_progress, -> { where(project_status: 'in progress') }
end
