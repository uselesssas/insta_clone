require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:post) }
  # it { is_expected.to validate_uniqueness_of(:post_id).scoped_to(:user_id) }
end
