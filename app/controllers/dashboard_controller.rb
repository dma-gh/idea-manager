class DashboardController < ApplicationController
  def index
  end
  
  def people
    @people = Person.all
  end
end
