class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :title, presence: :true
  validates :description, presence: :true
  validates :author_firstname, presence: :true
  validates :author_lastname, presence: :true, length: { minimum: 3 }
  validates :rating, presence: :true, inclusion: { in: 1..5 }
  mount_uploader :image, BookImageUploader


  def identify
    identification = self.title + self.author_lastname
  end

end
