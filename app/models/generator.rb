class Generator < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  belongs_to :author, class_name: "User"
  has_many :generator_snippets
  has_many :snippets, through: :generator_snippets
end
