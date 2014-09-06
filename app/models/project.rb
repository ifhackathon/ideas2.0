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
#  photo       :string(255)
#

class Project < ActiveRecord::Base
  include AASM
  belongs_to :user
  has_many :project_finance_costs
  has_many :project_materials
  has_many :project_people_times

  aasm :column => 'status' do
    state :in_process, :initial => true
    state :successful
    state :fail

    event :success do
      transitions :from => :in_process, :to => :successful
    end

    event :fail do
      transitions :from => :in_process, :to => :fail
    end
  end
end
