# == Schema Information
#
# Table name: project_finance_costs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  money      :float
#  created_at :datetime
#  updated_at :datetime
#  project_id :integer
#  total      :float            default(0.0)
#

class ProjectFinanceCost < ActiveRecord::Base
  belongs_to :project

  has_many :estimates, as: :estimateble
  has_many :volunteers, through: :estimates, source: :user

  validates :name, presence: true
  validates :money, presence: true
end
