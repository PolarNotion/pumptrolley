class Snippet < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  acts_as_list
  
  belongs_to :parent, class_name: "Snippet"
  belongs_to :author, class_name: "User"
  
  has_many :generator_snippets
  has_many :generators, through: :generator_snippets

  validates_presence_of :name,
                        :description,
                        :documentation_url,
                        :install_content,
                        :tags

  before_save :ensure_privacy_token

  def ensure_privacy_token
    unless self.privacy_token.present?
      self.privacy_token = SecureRandom.hex(15)
    end
  end
end
