class EventsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @event = @project.events.new
  end
  
  def edit
    @project = Project.find(params[:project_id])
    @event = Event.find(params[:id])
  end
  
  def create
    @project = Project.find(params[:project_id])
    @event = @project.events.new(event_params)
    @event.updated_at = event_params[:updated_at]
    @event.person = current_person
    
    if @event.save!
      redirect_to @project
    else
      render :new
    end
  end
  
  def update
    @project = Project.find(params[:project_id])
    @event = Event.find(params[:id])
    
    if @event.update(event_params)
      redirect_to @project
    else
      render :edit
    end
  end
  
  private
  def event_params
    params.require(:event).permit(:title, :description, :updated_at, :project_id)
  end
end
