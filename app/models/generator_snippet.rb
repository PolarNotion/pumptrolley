class GeneratorSnippet < ActiveRecord::Base
  belongs_to :generator
  belongs_to :snippet

  acts_as_list scope: :generator
end
