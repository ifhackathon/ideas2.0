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
#  phone            :string(255)
#  email            :string(255)
#

class Estimate < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :estimateble, polymorphic: true
end
