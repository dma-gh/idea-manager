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

  def update_person
    @person = Person.find(params[:id])
    @person.update_attributes(person_params)
    @person.save!

    redirect_to person_skills_path(@person)
  end
  
  def people
    @people = Person.all
  end

  def person
    @person = Person.find(params[:id])
  end

  def organization
    @data = []

    Person.all.each do |person|
      @data << [person.competence, person.communication, person.first_name] unless person.manager?
    end
  end

  def message
    @project = Project.find(params[:project_id])
    sms = SMSEasy::Client.new
    people = []

    params[:project][:people]&.each do |person_id|
      people << Person.find(person_id)
    end

    people.each do |person|
      sms.deliver(person.phone, person.carrier, "#{params[:message]} - This is a NoReply text, replies are not monitored.")
    end

    redirect_to @project
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

  private
    def person_params
      params.require(:person).permit(:title, :communication, :hanging_skill, :packing_skill, :painting_skill, :maintenance_skill, :welding_skill, :tech_skill, :renu_skill, :batch_skill, :harley_skill, :forklift_skill, :wash_skill, :people => [], :people_mbl => [])
    end
  
end
