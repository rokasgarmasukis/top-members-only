class Post < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 5, maximum: 20, message: " has to be 5 to 20 charachters long" }
  validates :content, length: { minimum: 5, maximum: 40, message: " has to be 5 to 40 charachters long" }
end
