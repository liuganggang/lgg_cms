class Category < ApplicationRecord
  has_many :article

  validates :title, presence: true
end
