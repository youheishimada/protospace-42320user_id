class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # バリデーション
  validates :title, :catch_copy, :concept, :image, presence: true
end