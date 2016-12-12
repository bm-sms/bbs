module Bbs
  class TopicsController < Bbs::ApplicationController
    before_action :authenticate_user, only: %i(create)
    before_action :set_category

    def new
      @topic = @category.topics.build
    end

    def create
      @topic = @category.topics.build(topic_params)

      if @topic.save
        redirect_to bbs.category_topics_path(@category), notice: t('.success')
      else
        redirect_back fallback_location: main_app.root_path, alert: @topic.errors.full_messages
      end
    end

    def index
      @topics = @category.topics.order(:created_at).page(params[:page]).per(Bbs.config.topics_per_page)
    end

    private

    def set_category
      @category = Bbs::Category.find(params[:category_id])
    end

    def topic_params
      params.require(:topic).permit(Bbs::Topic.permitted_attributes)
        .merge(author: current_user)
    end
  end
end
