require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation test' do
    subject { build(:comment) }

    it 'comment is valid' do
      is_expected.to be_valid
    end
  end
end
