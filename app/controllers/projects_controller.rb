class ProjectsController < ApplicationController
  
  def index
    if current_person.manager?
      @projects = Project.all
    else
      @projects = current_person.projects
    end
  end
  
  def new
    @people = Person.all.order "last_name ASC"
  end
  
  def create
      @project = Project.new(title: project_params[:title], description: project_params[:description])
      
      # unless the current person is already added, add them
      if project_params[:people].nil? || project_params[:people].all? { |person| person != current_person.id.to_s } then
        @project.people << current_person
      end
      
      project_params[:people]&.each do |person_id|
        @project.people << Person.find(person_id)
      end

      if @project.save!
        @project.events = []
        redirect_to @project
      else
        render :new
      end
  end
  
  def show
    @project = Project.find(params[:id])
    @events = @project.events.all.order "deadline ASC"
    @event = Event.new(deadline: Date.today)
  end
    
  def edit
    @people = Person.all
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to projects_path
  end
  
  private
    def project_params
      params.require(:project).permit(:title, :description, :people => [])
    end
end
