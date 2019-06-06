class Book < ApplicationRecord
  searchkick
  belongs_to :user
  belongs_to :age_group
  has_many :reviews
  has_many :upvotes
  has_many :downvotes
  validates :title, presence: :true
  validates :description, presence: :true
  validates :author_firstname, presence: :true
  validates :author_lastname, presence: :true, length: { minimum: 3 }
  mount_uploader :image, BookImageUploader
  ratyrate_rateable 'overall'

  def identify
    identification = self.title + self.author_lastname
  end

end
