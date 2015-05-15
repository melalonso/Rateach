class HomeController < ApplicationController

  def index
    @universities = University.all
  end

  def test
  end
  
end
