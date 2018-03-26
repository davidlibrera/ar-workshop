require 'rails_helper'

RSpec.describe Post, type: :model do
  describe ".title_matches" do
    let!(:post) { create(:post, title: "Hello world!") }
    let!(:another_post) { create(:post, title: "Another post") }

    let(:scope) { Post.title_matches("world") }

    it "returns only the post" do
      expect(scope).to match_array [post]
    end
  end

  describe "with comments" do
    let!(:post) { create(:post, title: "Hello world!") }
    let!(:another_post) { create(:post, title: "Another post") }

    let!(:comment) { create(:comment, post: post) }
    let!(:another_comment) { create(:comment, post: post) }

    let(:scope) { Post.with_comments }

    it "returns only the post" do
      expect(scope).to match_array [post]
    end
  end

  describe "with published comments" do
    let!(:post) { create(:post, title: "Hello world!") }
    let!(:another_post) { create(:post, title: "Another post") }
    let!(:third_post) { create(:post, title: "Third post") }

    let!(:published_comment) do
      create(:comment, post: post, status: "published")
    end


    let!(:another_published_comment) do
      create(:comment, post: post, status: "published")
    end

    let!(:draft_comment) { create(:comment, post: post) }
    let!(:another_draft_comment) { create(:comment, post: another_post) }

    let(:scope) { Post.with_published_comments }

    it "returns only the post" do
      expect(scope).to match_array [post]
    end
  end
end
