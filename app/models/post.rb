class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  per_page = 2
end
