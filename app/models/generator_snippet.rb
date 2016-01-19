class GeneratorSnippet < ActiveRecord::Base
  belongs_to :generator
  belongs_to :snippet
end
