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

require 'rails_helper'

RSpec.describe ProjectMaterials, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
