class AgeGroup < ApplicationRecord
  has_many :books
  validates :group, presence: true
  validates :group, uniqueness: true
end
