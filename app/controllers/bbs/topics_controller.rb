module Bbs
  class TopicsController < ApplicationController
    before_action :set_category

    def index
      @topics = @category.topics
    end

    private

    def set_category
      @category = Bbs::Category.find(params[:category_id])
    end
  end
end
