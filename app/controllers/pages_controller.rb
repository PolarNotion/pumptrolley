class PagesController < ApplicationController
  def home
    @generator      = Generator.new
    @demo_generator = Generator.first
    @body_class     = ""
  end

  def profile
    @user         = User.find(params[:id])
    @generators   = @user.generators.where(is_private: false).order(is_featured: :desc, name: :asc)
    @snippets     = @user.snippets.where(is_private: false).order(is_featured: :desc, name: :asc)
  end

  def resources
    @public_generators = Generator.where(is_private: false).order(is_featured: :desc, name: :asc).all
    @public_snippets   = Snippet.where(is_private: false).order(is_featured: :desc, name: :asc).all
  end
end
