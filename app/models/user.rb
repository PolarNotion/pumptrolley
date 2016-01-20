class User < ActiveRecord::Base
  has_many :snippets, foreign_key: :author_id
  has_many :generators, foreign_key: :author_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def can_edit_generator(generator_id)
    generator = Generator.find(generator_id)
    generator.author_id == id
  end
end
