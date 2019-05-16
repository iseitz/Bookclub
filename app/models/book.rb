class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :title, presence: :true
  validates :description, presence: :true
  validates :author_firstname, presence: :true
  validates :author_lastname, presence: :true, length: { minimum: 3 }

  def identify
    identification = self.title + self.author_lastname
  end
end
