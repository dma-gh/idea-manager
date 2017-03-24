class CommentsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @event = Event.find(params[:event_id])
    @comment = Comment.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @event = Event.find(params[:event_id])
    @comment = @event.comments.new(comment_params)
    @comment.person = current_person
    
    @comment.save
    
    redirect_to :back
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
