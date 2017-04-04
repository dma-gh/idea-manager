class ProjectsController < ApplicationController
  
  def index
    if current_person.manager?
      @projects = Project.all.where(archived: false).order "updated_at DESC"
    else
      @projects = current_person.projects.where(archived: false).order "updated_at DESC"
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
    
      @project.creator_id = current_person.id

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
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    
    creator_id = @project.creator_id
    
    unless creator_id == current_person.id or current_person.manager?
      redirect_to @project
    end
    
    project = Project.new(title: project_params[:title], description: project_params[:description])
    project.events = @project.events
    
    people_list = project_params[:people]&.uniq
    
    people_list&.each do |person_id|
      project.people << Person.find(person_id)
    end
    
    project.creator_id = creator_id
    project.archived = project_params[:archived]
    
    if project.save
      @project.destroy
      redirect_to project
    else
      render :edit
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to projects_path
  end
  
  private
    def project_params
      params.require(:project).permit(:title, :archived, :creator_id, :description, :people => [])
    end
end
