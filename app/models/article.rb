class Article < ApplicationRecord
  belongs_to :category

  validates :category, :title, :content, presence: true
end
