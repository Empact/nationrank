# encoding: UTF-8

class Nation < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  CANONICAL_NAMES = {
    'Taiwan' => 'Taiwan, Province of China',
    'Slovak Republic' => 'Slovakia',
    'Korea, South' => 'Korea, Republic of',
    'Korea, North' => "Korea, Democratic People's Republic of",
    'Macedonia' => 'Macedonia, The Former Yugoslav Republic Of',
    'Trinidad & Tobago' => 'Trinidad and Tobago',
    'Moldova' => 'Moldova, Republic of',
    'Kyrgyz Republic' => 'Kyrgyzstan',
    'Bosnia & Herzegovina' => 'Bosnia and Herzegovina',
    'Russia' => 'Russian Federation',
    'Vietnam' => 'Viet Nam',
    'Bolivia' => 'Bolivia, Plurinational State of',
    'Tanzania' => 'Tanzania, United Republic of',
    'Iran' => 'Iran, Islamic Republic of',
    'Syria' => 'Syrian Arab Republic',
    'Côte d’Ivoire' => "Cote d'Ivoire",
    'Central African Rep.' => 'Central African Republic',
    'Congo, Dem. Rep. of' => 'Congo, the Democratic Republic of the',
    'Congo, Republic of' => 'Congo',
    'Venezuela' => 'Venezuela, Bolivarian Republic of'
  }

  class << self
    def canonical_name(name)
      CANONICAL_NAMES.fetch(name, name)
    end
  end
end
