module Bbs
  class CommentsController < Bbs::ApplicationController
    before_action :authenticate_user!, only: %i(create)
    before_action :set_topic

    def create
      @comment = @topic.comments.build(comment_params)

      if @comment.save
        redirect_to bbs.topic_comments_path(@topic), notice: t('.created')
      else
        @comments = comments
        render :index
      end
    end

    def index
      @comment = @topic.comments.build
      @comments = comments
    end

    private

    def set_topic
      @topic = Bbs::Topic.find(params[:topic_id])
    end

    def comment_params
      params.require(:comment).permit(Bbs::Comment.permitted_attributes)
        .merge(author: current_user)
    end

    def comments
      @topic.comments.order(:updated_at).page(params[:page]).per(10)
    end
  end
end
