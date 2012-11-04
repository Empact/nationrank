class Publication < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :created_by, class_name: 'User'
  belongs_to :report
  has_many :ratings

  validates_presence_of :name
end
