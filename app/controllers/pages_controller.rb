class PagesController < ApplicationController
  def home
    @generator      = Generator.new
    @demo_generator = Generator.first
    @body_class     = ""
  end
end
