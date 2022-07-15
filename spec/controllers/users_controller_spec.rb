require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before { sign_in user }

  describe '#show' do
    subject { process :show, method: :get, params: params }

    let!(:user) { create :user }
    let(:params) { { id: user.id } }

    it 'renders show template' do
      subject
      expect(response).to render_template :show
    end

    it 'assign @user' do
      subject
      expect(assigns(:user)).to eq user
    end

    context 'when user trying to see non-existent account' do
      let(:params) { { id: user.id + 1 } }

      it 'redirects back' do
        subject
        expect(response).to redirect_to root_path
      end
    end

    context 'when user in not signed in' do
      before { sign_out user }
      it 'redirects to the sign in page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  let!(:user) { create :user }

  describe '#follow' do
    subject { process :follow, method: :post, params: params }

    let!(:follower) { create :user }
    let(:params) { { id: follower.id } }

    it 'user starts follow another user' do
      expect { subject }.to change(Follow, :count).by(1)
    end

    it 'redirects back' do
      is_expected.to redirect_to user_path
    end
  end

  describe '#followings' do
    subject { process :followings, method: :get, params: params }

    let(:params) { { id: user.id } }

    it 'renders followings template' do
      subject
      expect(response).to render_template :followings
    end
  end

  describe '#followers' do
    subject { process :followers, method: :get, params: params }

    let(:params) { { id: user.id } }

    it 'renders follows template' do
      subject
      expect(response).to render_template :followers
    end
  end
end
