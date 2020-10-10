class Like < ApplicationRecord
  belongs_to :portfolio, counter_cache: :likes_count
  belongs_to :user
end
