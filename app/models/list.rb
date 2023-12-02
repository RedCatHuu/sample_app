class List < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true
  # rails c を使う場合、画像があると複雑になるのでコメントアウトする
  # validates :image, presence: true
end
