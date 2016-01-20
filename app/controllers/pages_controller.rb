class PagesController < ApplicationController
  def home
    @generator = Generator.new
    @body_class = "background-primary-light"
  end
end
