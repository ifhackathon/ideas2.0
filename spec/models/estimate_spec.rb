# == Schema Information
#
# Table name: estimates
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  estimateble_id   :integer
#  value            :string(255)
#  date             :string(255)
#  estimateble_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  project_id       :integer
#

require 'rails_helper'

RSpec.describe Estimate, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
