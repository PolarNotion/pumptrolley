class Generator < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  attr_accessor :email
  
  belongs_to :author, class_name: "User"

  has_many :generator_snippets
  has_many :snippets, through: :generator_snippets

  validates_presence_of :name

  validates_uniqueness_of :name

  before_save :ensure_privacy_token

  def ensure_privacy_token
    unless self.privacy_token.present?
      self.privacy_token = SecureRandom.hex(15)
    end
  end
end
