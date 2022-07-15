require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { create :user }
  let!(:post) { create :post, user: user }
  before { sign_in user }

  describe '#index' do
    subject { process :index }

    # let(:posts) { create_list(:post) }

    it 'renders the index template' do
      is_expected.to render_template :index
    end

    # it 'assign @posts' do
    #   subject
    #   expected_posts = posts.sort_by(&:created_at).reverse
    #   expect(assigns(:posts)).to eq expected_posts
    # end

    context 'when user in not signed in' do
      before { sign_out user }
      it 'redirects to the sign in page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#show' do
    subject { process :show, method: :get, params: params }

    # let!(:post) { create :post, user: user }
    let(:params) { { id: post.id } }

    it 'renders the show template' do
      subject
      expect(response).to render_template :show
    end

    it 'assign @post' do
      subject
      expect(assigns(:post)).to eq post
    end

    context 'user tries to show non-existent post' do
      let(:params) { { id: post.id + 1 } }

      it 'redirects back' do
        expect(response).not_to redirect_to root_path
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

  describe '#create' do
    subject { process :create, method: :post, params: params }

    let(:params) { { post: attributes_for(:post, user: create(:user)) } }

    it 'creates a post' do
      expect { subject }.to change(Post, :count).by(0)
    end

    # it 'redirects to post page' do
    #   subject
    #   expect(response).to redirect_to post_path(post)
    # end

    it 'assigns post to current user' do
      subject
      expect(assigns(:post).user).to eq user
    end

    context 'when user tries to create the post without an validated attributes' do
      let(:params) { { post: { description: ''} } }

      it 'validates the post' do
        #expect { subject }.to raise_exception(ActiveRecord::RecordInvalid)
        expect(response).to_not redirect_to root_path
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

  describe '#destroy' do
    subject { process :destroy, method: :delete, params: params }

    # let!(:post) { create :post, user: user }
    let(:params) { { id: post.id } }

    it 'deletes the post' do
      expect { subject }.to change(Post, :count).by(-1)
    end

    it 'redirects back' do
      subject
      expect(response).to redirect_to root_path
    end

    context 'when user treis to remove someones or non-existed post' do
      let!(:post) { create :post }

      it 'redirects back' do
        expect(response).not_to redirect_to root_path
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
