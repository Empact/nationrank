class Report < ActiveRecord::Base
  belongs_to :organization
  belongs_to :created_by, class_name: 'User'
end
