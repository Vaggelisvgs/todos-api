class Todo < ApplicationRecord
  # model association
  # if we delete a todo , items will be destroyed too
  has_many :items, dependent: :destroy
  
  # ntitle and creator can't be blank
  validates_presence_of :title, :created_by
end
