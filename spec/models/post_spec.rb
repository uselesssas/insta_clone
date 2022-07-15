require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:photos).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }
  it { is_expected.to have_many(:bookmarks).dependent(:destroy) }
  it { is_expected.to validate_length_of(:description).is_at_least(3).is_at_most(50) }
end
