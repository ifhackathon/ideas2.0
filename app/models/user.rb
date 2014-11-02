# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  image                  :string(255)
#  url                    :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => Rails.application.config.omniauth_providers.keys

  has_many :projects
  has_many :estimates
  has_many :project_finance_costs, through:  :estimates, source: :estimateble, source_type: "ProjectFinanceCost"
  has_many :project_people_times, through: :estimates, source: :estimateble, source_type: "ProjectPeopleTime"
  has_many :project_materials, through: :estimates, source: :estimateble, source_type: "ProjectMaterial"


  def largeimage
    "http://graph.facebook.com/#{self.uid}/picture?type=large"
  end
  def normalimage
    "http://graph.facebook.com/#{self.uid}/picture?type=normal"
  end
end


