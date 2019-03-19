class Book < ApplicationRecord
  belongs_to :user

  validates :opinion, length: {maximum: 200}
end
