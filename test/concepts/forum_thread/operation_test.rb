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
end
