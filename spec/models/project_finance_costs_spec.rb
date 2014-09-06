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

require 'rails_helper'

RSpec.describe ProjectFinanceCosts, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
