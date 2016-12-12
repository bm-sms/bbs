module Bbs
  class CommentsController < Bbs::ApplicationController
    before_action :authenticate_user, only: %i(create)
    before_action :set_topic

    def create
      @comment = @topic.comments.build(comment_params)

      if @comment.save
        redirect_to bbs.topic_comments_path(@topic), notice: t('.success')
      else
        redirect_back fallback_location: bbs.topic_comments_path(@topic), alert: @comment.errors.full_messages
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
      @topic.comments.order(:updated_at).page(params[:page]).per(Bbs.config.comments_per_page)
    end
  end
end
