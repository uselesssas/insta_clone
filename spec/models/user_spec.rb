require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  it { is_expected.to validate_length_of(:username).is_at_least(3).is_at_most(20) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }
  it { is_expected.to have_many(:bookmarks).dependent(:destroy) }
  it { is_expected.to have_many(:followed_users).class_name('Follow') }
  it { is_expected.to have_many(:followees).through(:followed_users) }
  it { is_expected.to have_many(:following_users).class_name('Follow') }
  it { is_expected.to have_many(:followers).through(:following_users) }
  it { is_expected.to validate_length_of(:real_name).is_at_least(2).is_at_most(20) }
  it { is_expected.to validate_length_of(:bio).is_at_most(300) }
  it { is_expected.to validate_length_of(:gender).is_at_most(20) }
end
