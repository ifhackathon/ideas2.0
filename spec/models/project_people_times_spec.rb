# == Schema Information
#
# Table name: project_people_times
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  day        :string(255)
#  integer    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  project_id :integer
#

require 'rails_helper'

RSpec.describe ProjectPeopleTimes, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
