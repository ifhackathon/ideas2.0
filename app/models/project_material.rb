# == Schema Information
#
# Table name: project_materials
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  quantity   :float
#  measure    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  project_id :integer
#

class ProjectMaterial < ActiveRecord::Base
  belongs_to :project
end
