require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create :user }
  let(:post) { create :post }
  before { sign_in user }

  describe '#create' do
    subject { process :create, method: :post, params: params }

    let!(:post) { create :post, user: user }
    let(:params) do
      {
        comment: attributes_for(:comment),
        post_id: post
      }
    end

    it 'creates a comment' do
      expect { subject }.to change(Comment, :count).by(0)
    end

    it 'redirects to parent post page' do
      subject
      expect(response).to_not redirect_to root_path
    end

    context 'when user tries to create the post without a body' do
      let(:params) do
        {
          comment: { body: ' ' },
          post_id: post
        }
      end

      it 'redirects back' do
        expect(response).not_to be_redirect
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
end
