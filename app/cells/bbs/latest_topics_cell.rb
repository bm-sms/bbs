module Bbs
  class LatestTopicsCell < ApplicationCell
    def show
      @topics = Bbs::Topic.order(:created_at).limit(Bbs.config.latest_topics_count)

      render
    end
  end
end
