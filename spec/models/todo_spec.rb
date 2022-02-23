require 'rails_helper'

# todo model test
RSpec.describe Todo, type: :model do
  # Association test
  # todo has a 1:m relationship with item
  it{ should have_many(:items).dependent(:destroy) }
  # Validation tests
  # columns title and created_by are present are required
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
 end
