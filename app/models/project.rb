# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  status      :string(255)
#  date_to     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  place       :string(255)
#  video       :string(255)
#  user_id     :integer
#

class Project < ActiveRecord::Base
  belongs_to :user
end
