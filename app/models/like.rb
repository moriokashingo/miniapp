class Like < ApplicationRecord
  belongs_to :blog, counter_cache: :likes_count
  belongs_to :user
  validates_uniqueness_of :blog_id, scope: :user_id
end
