class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :reports, foreign_key: :created_by_id
end
