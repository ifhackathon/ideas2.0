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
#

class ProjectFinanceCost < ActiveRecord::Base
  belongs_to :project
end
