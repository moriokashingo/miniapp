class Blog < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  
  has_many :tag_blogs,dependent: :destroy
  has_many :tags, through: :tag_blogs,dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

end
