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
  
  def toggle_complete
    @project = Project.find(params[:project_id])
    @event = Event.find(params[:event_id])
    @event.complete = !@event.complete
    @event.save
    
    redirect_to @project
  end
  
  private
  def event_params
    params.require(:event).permit(:title, :description, :deadline, :project_id)
  end
end
