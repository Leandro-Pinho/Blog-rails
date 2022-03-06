class CommentsController < ApplicationController
    before_action :set_idea

    def create
        @idea = Idea.find(params[:idea_id])
        @idea.comments.create! params.required(:comment).permit(:name, :content)
        redirect_to idea_path(@idea)
    end

    def destroy 
        @idea = Idea.find(params[:idea_id])
        @comment = @idea.comments.find(params[:id])
        @comment.destroy
        redirect_to idea_path(@idea)
    end

    private 
        def set_idea
           @idea = Idea.find(params[:idea_id])
        end
end
