module Bbs
  class CommentsController < ApplicationController
    before_action :set_topic

    def create
      @comment = @topic.comments.build(comment_params)

      if @comment.save
        redirect_to bbs.topic_comments_path(@topic)
      else
        redirect_back fallback_location: main_app.root_path
      end
    end

    def index
      @comments = @topic.comments.order(:created_at).page(params[:page]).per(5)
    end
    private

    def set_topic
      @topic = Bbs::Topic.find(params[:topic_id])
    end

    def comment_params
      params.require(:comment).permit(Bbs::Comment.permitted_attributes)
        .merge(author: current_user)
    end
  end
end
