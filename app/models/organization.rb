class Organization < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_name, use: :slugged

  belongs_to :created_by, class_name: 'User'
  has_many :reports

  validates :name, presence: true, uniqueness: true

  def slug_name
    short_name || name
  end
end
