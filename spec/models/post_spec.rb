require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  it 'post is valid' do
    is_expected.to be_valid
  end
end
