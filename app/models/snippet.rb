class Snippet < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  acts_as_list
  
  belongs_to :parent, class_name: "Snippet"
  belongs_to :author, class_name: "User"
  
  has_many :generator_snippets
  has_many :generators, through: :generator_snippets
end
