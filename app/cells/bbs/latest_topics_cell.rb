module Bbs
  class LatestTopicsCell < ApplicationCell
    def show
      @topics = Bbs::Topic.order(:created_at).limit(10)

      render
    end
  end
end
