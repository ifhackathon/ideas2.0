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

class ProjectPeopleTime < ActiveRecord::Base
  belongs_to :project
end
