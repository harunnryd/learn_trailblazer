class ForumThreadsControllerController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    # -------------------------------------------------------
    # note : run method menyederhanakan pemanggilan operation
    # yang awalnya ForumThread::Create.(params)
    # -------------------------------------------------------
    run ForumThread::Create do |operation|
      # --------------------------------------------------
      # note : ketika sukses blok ini baru akan dijalankan
      # --------------------------------------------------
      return redirect_to operation.model
    end
    render action: :new
  end
end
