require 'rails_helper'

# item model test
RSpec.describe Item, type: :model do
  # Assosiation test
  # item must belongs to a single todo
  it { should belong_to(:todo) }
  # Validation test
  # column name is required
  it { should validate_presence_of(:name) }
end
