class Estimate < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :estimateble, polymorphic: true
end
