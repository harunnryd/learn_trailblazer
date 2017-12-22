# ------------------------------------------------
# note : forumthread disini samasekali bukan model
# forumthread disini hanya sekedar namespace saja
# ------------------------------------------------
class ForumThread < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include Model

    model ForumThread, :create # model semantik

    # --------------------------------------------------
    # note : isi blok di dalam contract merupakan sebuah
    # validasi yang digunakan oleh model forum_thread.rb
    # -------------------------------------------------
    contract do
      property :title
      property :content

      validates :title, presence: true, length: {in: 5..30}
      validates :content, allow_blank: true, length: {in: 4..160}
    end

    def process(params = {forum_thread: {title: "", content: ""}})
      # -------------------------------------------------------------------
      # note : yuhuuu, meng-include Model sama saja seperti menginstruksi
      # rails untuk menggunakan model dan operasinya, yap disini kita meng-
      # gunakan operasi create dan tadaaaa~ trailblazer langsung tau model
      # dan method apa yang ingin digunakan setelah proses validasi :p
      # -------------------------------------------------------------------
      validate(params[:forum_thread]) do |f|
        f.save
      end
    end
  end
end
