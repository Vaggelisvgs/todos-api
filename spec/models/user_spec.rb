require 'rails_helper'

# user model test
RSpec.describe User, type: :model do
  # Association test
  # user has a 1:m relationship with todo
  it { should have_many(:todos) }
  # Validation tests
  # name, email and password_digest are required
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end