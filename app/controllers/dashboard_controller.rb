class DashboardController < ApplicationController
  def index
    @events = []
    
    current_person.projects.each do |project|
      project.events.each do |event|
        if event.deadline > Date.today then
          @events << event
        end
      end
    end
    
    @events.sort_by! { |event| event.deadline }
  end
  
  def people
    @people = Person.all
  end
  
  def demote_manager
    person = Person.find(params[:manager_id])
    
    if current_person.manager?
      person.manager = false
    end
    
    person.save!
    
    redirect_to dashboard_people_path
  end
  
  def make_manager
    person = Person.find(params[:manager_id])
    
    if current_person.manager?
      person.manager = true
    end
    
    person.save!
    
    redirect_to dashboard_people_path
  end
  
end
