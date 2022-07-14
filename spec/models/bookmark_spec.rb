require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  context 'validation test' do
    subject { build(:bookmark) }

    it 'bookmark is valid' do
      is_expected.to be_valid
    end
  end
end
