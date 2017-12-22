require "test_helper"

class ForumThreadOperationTest < MiniTest::Spec
  describe "Create" do
    it 'persists valid' do
      forum_thread = ForumThread::Create.(forum_thread: {
        title: "intro",
        content: "Halo nama saya harun"
      }).model

      forum_thread.persisted?.must_equal true
      forum_thread.title.must_equal "intro"
      forum_thread.content.must_equal "Halo nama saya harun"
    end
  end

  describe "Can't create" do
    it 'persist not valid' do
      # --------------------------------------------------------------------
      # note : penggunaan method run akan mengembalikan boolean hasil dari -
      # validasi dan hasil operasinya ..
      # --------------------------------------------------------------------
      result, operation = ForumThread::Create.run(forum_thread: {title: "", content: ""})
      result.must_equal false
      # ----------------------------------------------------------
      # note : penggunaan method model, digunakan untuk meng-akses
      # record dari hasil operasi, dalam kasus ini method create
      # ----------------------------------------------------------
      operation.model.persisted?.must_equal false
      # ---------------------------------------------------------
      # note : method contract berguna untuk mengakses error yang
      # didapat, yap kita mendefinisikan ulang di operation.rb
      # ---------------------------------------------------------
      operation.contract.errors.size.must_equal 2
    end
  end
end
