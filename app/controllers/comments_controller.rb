class CommentsController < ApplicationController
    before_action :set_idea only: %i[ show edit update destroy ]

    def create
        @idea.comments.create! params.required(:comment).permit(:name, :content)
        redirect_to @idea
    end

    def destroy 
        @comment.destroy
    end

    private 
        def set_idea
           @idea = Idea.find(params[:idea_id])
        end
end
