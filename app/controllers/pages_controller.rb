class PagesController < ApplicationController
  def home
    @generator = Generator.new
    @body_class = "background-gray-light"
  end
end
