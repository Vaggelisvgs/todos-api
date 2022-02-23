class Item < ApplicationRecord
  # model association
  belongs_to :todo

  # name can't be blank
  validates_presence_of :name
end
