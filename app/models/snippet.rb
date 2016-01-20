class Snippet < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]
  
  belongs_to :parent, class_name: "Snippet"
  has_many :generator_snippets
  has_many :generators, through: :generator_snippets
end
