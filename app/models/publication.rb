class Publication < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :report

  validates_presence_of :name
end
