require 'rails_helper'

RSpec.describe 'Example' do
  context 'math' do
    it 'should be 42' do
      expect(6 * 7).to eq(42)
    end
  end

  context String do
    let(:string) { String.new } # string = String.new
    it 'should be equal to an empty string' do
      expect(string).to eq('')
    end
  end
end
