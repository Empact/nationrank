class Publication < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :report
  has_many :ratings

  validates_presence_of :name
end
