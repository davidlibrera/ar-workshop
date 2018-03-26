class Comment < ApplicationRecord
  belongs_to :post

  enum status: {
    draft: "draft",
    archived: "archived",
    published: "published"
  }
end
