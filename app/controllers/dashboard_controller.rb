class DashboardController < ApplicationController
  def index
    @events = []
    
    current_person.projects.each do |project|
      project.events.each do |event|
        #The Event must be less than 5 days expired or in the future and not Archived
        if event.deadline >= (Date.today - 5.days) and !project.archived then
          @events << event
        end
      end
    end
    
    @events.sort_by! { |event| event.deadline }
  end
    
  def archived
    if current_person.manager?
      @projects = Project.all.where(archived: true)
    else
      @projects = current_person.projects.all.where(archived: true)
    end
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
