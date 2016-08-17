module Bbs
  class CommentsController < ApplicationController
    before_action :set_topic

    def index
      @comments = @topic.comments
    end

    private

    def set_topic
      @topic = Bbs::Topic.find(params[:topic_id])
    end
  end
end
