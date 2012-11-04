class Rating < ActiveRecord::Base
  belongs_to :publication
  belongs_to :nation
  belongs_to :created_by, class_name: 'User'

  scope :by_rank, order('rank ASC')

  def nation_name
    nation.try(:name)
  end

  def nation_name=(nation_name)
    self.nation = Nation.find_by_name!(Nation.canonical_name(nation_name))
  end
end
