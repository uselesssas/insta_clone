# require 'rails_helper'
#
# RSpec.describe PostsController, type: :controller do
#   let(:user) { create :user }
#   before { sign_in user }
#
#   describe '#index' do
#     subject { process :index }
#
#     let(:posts) { create_list(:post, 5) }
#
#     it 'renders' do
#       subject
#       expect(response).to render_template :index
#     end
#
#     it 'assigns @post' do
#       subject
#       expect(assigns(:posts)).to eq posts
#     end
#   end
# end
