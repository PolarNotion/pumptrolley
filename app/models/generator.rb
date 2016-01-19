class Generator < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  has_many :generator_snippets
  has_many :snippets, through: :generator_snippets
end
