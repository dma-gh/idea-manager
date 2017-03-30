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
    
    if event_params[:recur].eql? "1" then
      #Event is recurring 
      event_base_date = Date.parse(@event.deadline.to_s)
      recur_often = event_params[:recur_often]
      
      event_params[:recur_times].to_i.times do |i|
        
        if recur_often.eql? "daily" then
          event = @project.events.new(event_params)
          event.deadline = event_base_date + (i + 1).days
          event.person = current_person
          event.save!
        elsif recur_often.eql? "weekly" then
          event = @project.events.new(event_params)
          event.deadline = event_base_date + (i + 1).weeks
          event.person = current_person
          event.save!
        elsif recur_often.eql? "monthly" then
          event = @project.events.new(event_params)
          event.deadline = event_base_date + (i + 1).months
          event.person = current_person
          event.save!
        elsif recur_often.eql? "yearly" then
          event = @project.events.new(event_params)
          event.deadline = event_base_date + (i + 1).years
          event.person = current_person
          event.save!
        end
      end
    end
    
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
    params.require(:event).permit(:title, :description, :deadline, :project_id, :recur, :recur_often, :recur_times)
  end
end
