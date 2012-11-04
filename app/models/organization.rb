class Organization < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :created_by, class_name: 'User'

  validates :name, presence: true, uniqueness: true
end
