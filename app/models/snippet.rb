class Snippet < ActiveRecord::Base
  has_many :generator_snippets
  has_many :generators, through: :generator_snippets
end
