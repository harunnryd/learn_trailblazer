class ForumThread < ActiveRecord::Base
  class Create < Trailblazer::Operation
    def process(params = {})
      @model = ForumThread.create(params[:forum_thread])
    end
  end
end
