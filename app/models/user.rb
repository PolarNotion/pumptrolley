class User < ActiveRecord::Base
  has_many :snippets,   foreign_key: :author_id
  has_many :generators, foreign_key: :author_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :_email_temporary_password

  def can_edit_generator(generator_id)
    generator = Generator.find(generator_id)
    generator.author_id == id
  end

  def can_edit_snippet(snippet_id)
    snippet = Snippet.find(snippet_id)
    snippet.author_id == id
  end

  def accessable_snippets
    Snippet.order(is_featured: :desc, name: :asc).select do |s|
      s.author_id = id or
      s.is_private == false
    end
  end

  def photo_url(size)
    photo_size   = size ? size : "500"
    gravatar_id  = Digest::MD5.hexdigest(email.downcase)
    
    "http://www.gravatar.com/avatar/#{gravatar_id}?s=#{photo_size}px"
  end

  private

  def _email_temporary_password
    # TODO Send user password
  end
end
