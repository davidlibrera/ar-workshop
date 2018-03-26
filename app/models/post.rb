class Post < ApplicationRecord
  enum status: {
         draft: "draft",
         archived: "archived",
         published: "published"
       }

  scope :title_matches, ->(text) do
    all
  end
end
