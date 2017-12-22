class ForumThreadsController < ApplicationController
  def index
  end

  def new
    # ----------------------------------------------------------------
    # note : [FORMULIR RENDERING] form method hanya akan meng-instance
    # modelnya, namun tidak akan mengeksekusi proses apapun :D
    # ----------------------------------------------------------------
    form ForumThread::Create
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
