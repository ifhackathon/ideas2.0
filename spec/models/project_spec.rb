# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  status      :string(255)
#  date_to     :date(255)
#  created_at  :datetime
#  updated_at  :datetime
#  place       :string(255)
#  video       :string(255)
#  user_id     :integer
#  photo       :string(255)
#

require 'rails_helper'

RSpec.describe Project, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
