class Report < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :organization
  belongs_to :created_by, class_name: 'User'

  has_many :publications

  accepts_nested_attributes_for :organization, :publications

  validates :name, presence: true, uniqueness: true
end
