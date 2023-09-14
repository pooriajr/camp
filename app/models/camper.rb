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
end
