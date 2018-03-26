class Building < ApplicationRecord
  scope :with_approximately_rooms, ->(rooms_count) do
    all
  end
end
