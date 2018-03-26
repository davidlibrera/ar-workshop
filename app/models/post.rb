class Post < ApplicationRecord
  has_many :comments

  enum status: {
         draft: "draft",
         archived: "archived",
         published: "published"
       }

  scope :title_matches, ->(text) do
    all
  end

  scope :with_comments, -> do
    all
  end
end
