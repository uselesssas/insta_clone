require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'validation test' do
    subject { build(:like) }

    it 'like is valid' do
      is_expected.to be_valid
    end
  end
end
