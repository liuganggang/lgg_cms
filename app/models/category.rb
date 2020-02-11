class Category < ApplicationRecord
  has_many :article

  validates :titile, presence: true
end
