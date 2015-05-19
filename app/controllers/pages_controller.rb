class PagesController < ApplicationController

  def index
    @universities = University.all
  end

  def test
  end
  
end
