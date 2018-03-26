require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "string pattern search" do
    context "Simple operator" do
      let!(:post) { create(:post, title: "Hello world!") }
      let!(:another_post) { create(:post, title: "Another post") }

      let(:scope) { Post.title_matches("world") }

      it "returns only the post" do
        expect(scope).to match_array [post]
      end
    end
  end
end