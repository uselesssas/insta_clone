require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it 'user is valid' do
    is_expected.to be_valid
  end
end
