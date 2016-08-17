module Bbs
  class CommentsController < ApplicationController
    before_action :set_topic

    def index
      @comments = @topic.comments.order(:created_at).page(params[:page]).per(5)
    end

    private

    def set_topic
      @topic = Bbs::Topic.find(params[:topic_id])
    end
  end
end
