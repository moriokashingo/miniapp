class Tag < ApplicationRecord
  validates :name, uniqueness: { scope: :name }

  has_many :tag_blogs,dependent: :destroy
  has_many :blogs, through: :tag_blogs,dependent: :destroy
end
